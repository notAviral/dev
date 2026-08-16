if status is-interactive
    if type -q fzf && type -q tmux # dependencies
        bind \cf sessioner
        bind -M insert \cf sessioner
    end
end
