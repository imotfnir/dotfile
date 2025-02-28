#!/bin/bash

# Dynamically set SOURCE_DIR to the directory where this script is located
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "SOURCE_DIR is: $SOURCE_DIR"

# Define the mapping of source config files to target locations, supporting sudo paths
declare -A CONFIG_MAP
CONFIG_MAP=(
    ["$SOURCE_DIR/i3"]="$HOME/.config/i3/config"
    ["$SOURCE_DIR/tmux.conf"]="$HOME/.tmux.conf"
    ["$SOURCE_DIR/tmux.conf.local"]="$HOME/.tmux.conf.local"
    ["$SOURCE_DIR/vimrc"]="$HOME/.vimrc"
    # ["$SOURCE_DIR/git/gitconfig"]="$HOME/.gitconfig"       # No sudo needed
    # ["$SOURCE_DIR/some_system_conf"]="/etc/some_conf"      # Example requiring sudo
)

# Check if sudo is needed for a target path
needs_sudo() {
    local target="$1"
    # Assume sudo is needed if the target path is not under $HOME
    if [[ "$target" != "$HOME"* ]]; then
        return 0  # Needs sudo
    fi
    return 1  # No sudo needed
}

# Ensure the target directory exists, creating it if necessary
ensure_dir() {
    local target_dir=$(dirname "$1")
    if [ ! -d "$target_dir" ]; then
        echo "Creating directory: $target_dir"
        if needs_sudo "$target_dir"; then
            sudo mkdir -p "$target_dir"
        else
            mkdir -p "$target_dir"
        fi
    fi
}

# Install function: create symlinks with backup if needed
install_config() {
    for src in "${!CONFIG_MAP[@]}"; do
        local target="${CONFIG_MAP[$src]}"
        echo "Processing: $src -> $target"

        # Ensure the target directory exists
        ensure_dir "$target"

        # If the target exists and is not a symlink, back it up
        if [ -e "$target" ] && [ ! -L "$target" ]; then
            echo "Backing up existing file: $target"
            if needs_sudo "$target"; then
                sudo mv "$target" "$target.bak"
            else
                mv "$target" "$target.bak"
            fi
        # If the target is a symlink, remove it first
        elif [ -L "$target" ]; then
            echo "Removing existing symlink: $target"
            if needs_sudo "$target"; then
                sudo rm "$target"
            else
                rm "$target"
            fi
        fi

        # Create the symlink
        echo "Creating symlink: $src -> $target"
        if needs_sudo "$target"; then
            sudo ln -sf "$src" "$target"
        else
            ln -sf "$src" "$target"
        fi
    done
}

# Uninstall function: remove symlinks and restore backups if they exist
uninstall_config() {
    for src in "${!CONFIG_MAP[@]}"; do
        local target="${CONFIG_MAP[$src]}"
        echo "Processing uninstall: $target"

        # If the target is a symlink, remove it
        if [ -L "$target" ]; then
            echo "Removing symlink: $target"
            if needs_sudo "$target"; then
                sudo rm "$target"
            else
                rm "$target"
            fi

            # Check for a backup file and restore it if it exists
            if [ -e "$target.bak" ]; then
                echo "Restoring backup: $target.bak -> $target"
                if needs_sudo "$target"; then
                    sudo mv "$target.bak" "$target"
                else
                    mv "$target.bak" "$target"
                fi
            fi
        fi
    done
}

# Main logic: handle install or uninstall commands
case "$1" in
    "install")
        install_config
        echo "Installation completed!"
        ;;
    "uninstall")
        uninstall_config
        echo "Uninstallation completed!"
        ;;
    *)
        echo "Usage: $0 {install|uninstall}"
        exit 1
        ;;
esac