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
)

precmd () { echo -n "\x1b]1337;CurrentDir=$(pwd)\x07" }

