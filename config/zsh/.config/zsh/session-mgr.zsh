function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list | fzf --height 40% --reverse --border-label ' Session Picker ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N            sesh-sessions
bindkey -M emacs '^L' sesh-sessions
bindkey -M vicmd '^L' sesh-sessions
bindkey -M viins '^L' sesh-sessions
