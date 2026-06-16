
if status is-interactive
    function technoblade
        if test -n "(pacman -Qdtq)"
            sudo pacman -Rs --noconfirm (pacman -Qdtq)
            clear
            echo "killed all orphans"
        else
            echo "no orphans to kill nerd"
        end
    end
end
