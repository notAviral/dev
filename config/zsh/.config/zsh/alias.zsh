
# --------------------------------------
# Aliases
# --------------------------------------

# Common Aliases
alias vim='nvim'
alias v='nvim'
alias c='clear'
alias e='exit'
alias t='tmux'
alias nt='nitch'
alias cd='z'
alias l='exa -lah'

# Extra QoL
alias technoblade='[[ -n $(pacman -Qdt) ]] && sudo pacman -Rs --noconfirm $(pacman -Qdtq) && echo "killed all orphans" || echo "no orphans to kill nerd"'
alias nano='nvim'
alias fixbt='pactl set-card-profile bluez_card.B6_C2_D5_83_BF_6E a2dp-sink-sbc_xq'
