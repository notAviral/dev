function sessioner
    if type -q fish
        set -l script "$HOME/.config/tmux/scripts/sessioner.sh"
        if set -q TMUX
            tmux popup -E -w 80% -h 80% "$script"
        else
           "$script"
        end
    end
end


