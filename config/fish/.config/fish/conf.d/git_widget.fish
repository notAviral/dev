function lazygit_widget
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        if set -q TMUX
            tmux new-window -n lazygit lazygit
        else
            lazygit
        end
        commandline -f repaint
    else
        echo "not a git directory"
    end
end

if status is-interactive
    bind \cg lazygit_widget
end
