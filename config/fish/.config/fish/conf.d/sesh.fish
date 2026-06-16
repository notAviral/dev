function sesh-sessions
    set session (sesh list | fzf --height 40% --reverse --border-label ' Session Picker ' --border --prompt '⚡  ')
    commandline -f repaint
    if test -z "$session"
        return
    end
    sesh connect $session
end

bind \cl sesh-sessions
