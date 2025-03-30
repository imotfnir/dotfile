plugins=(
    git
    git-auto-fetch
    zsh-autosuggestions
    last-working-dir
    solarized-man
    zsh-syntax-highlighting
    colored-man-pages
    colorize
    autojump
    copyfile
    copypath
    copybuffer
    dirhistory
    autopep8
    docker
    docker-compose
    conda
    kubectl
    systemd
    fzf
    fzf-tab
    eza
    zoxide
    thefuck
    entr
)

precmd () { echo -n "\x1b]1337;CurrentDir=$(pwd)\x07" }

if [[ -z "${__zoxide_z+x}" ]]; then
    cd () {
        __zoxide_z "$@"
    }
fi

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
    local command=$1
    shift
    case "$command" in
        cd)           fzf --preview 'eza -T --color=always {} | head -200' "$@" ;;
        ssh)          fzf --preview 'dig {}' "$@" ;;
        export|unset) fzf --preview "eval 'echo \$'{}" "$@" ;;
        *)            fzf --preview 'batcat --color=always {}' "$@" ;;
    esac
}