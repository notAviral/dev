function technoblade
    if command -v pacman >/dev/null
        if test -n "(pacman -Qdtq)"
            echo "On Arch linux"
            sudo pacman -Rs --noconfirm (pacman -Qdtq)
            echo "killed all orphans"
        else
            echo "no orphans to kill nerd"
        end
    else if command -v nixos-rebuild >/dev/null
        echo "On Nix os"
        nix-collect-garbage -d 
        echo "killed all orphans"
    else 
        echo "Not supported OS"
    end
end
