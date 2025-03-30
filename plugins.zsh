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
    zoxide
)

precmd () { echo -n "\x1b]1337;CurrentDir=$(pwd)\x07" }

if [[ -z "${__zoxide_z+x}" ]]; then
    cd () {
        __zoxide_z "$@"
    }
fi
