alias ls="eza -gbHi --git --git-repos --color=always"
alias rm="trash"
alias gitl="lazygit"
alias lg="lazygit"
alias dockerl="lazydocker"
alias sct="systemctl-tui"
alias vim="nvim"
alias ai="aichat"
alias cat="batcat --paging=never"

history-count() {
    omz_history -f | awk '{print $4}' | sort -r | uniq -c | sort -n
}

man-toc() {
    zcat "$(man -w "$@")" | grep '^\.SH'
}
