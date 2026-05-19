
# --------------------------------------
# Aliases
# --------------------------------------

# Common Aliases
alias vim='nvim'
alias v='nvim'
alias c='clear'
alias e='exit'
alias t='tmux'
alias nf='fastfetch'
alias ff='fastfetch'

# Extra QoL
alias technoblade='[[ -n $(pacman -Qdt) ]] && sudo pacman -Rs --noconfirm $(pacman -Qdtq) && echo "killed all orphans" || echo "no orphans to kill nerd"'
alias nano='nvim'
# alias ~='cd ~'

# Conditional Aliases
if command -v zoxide >/dev/null 2>&1; then
    alias cd='z'
fi

if command -v exa >/dev/null 2>&1; then
    alias ll='exa -lah'
fi
