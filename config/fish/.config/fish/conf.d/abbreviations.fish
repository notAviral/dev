
if status is-interactive 

    abbr -a v "nvim"
    abbr -a e "exit"
    abbr -a c "clear"
    abbr -a t "tmux"

    abbr -a j "z"

    abbr -a leet "nvim -c Leet"

    abbr -a l  "ls -lhAF"

    abbr -a lg "lazygit"
    abbr -a ghd "gh dash"

    abbr -a o 'xdg-open'

    if command -v pacman >/dev/null then
        if command -v paru >/dev/null then
            abbr -a p "paru"
        else 
            abbr -a p "sudo pacman"
        end
    end

    abbr -a d "docker"
    abbr -c docker c "compose"
    abbr -c docker b -- "--build"

    # Weirdest abbriviations 
    abbr -a :q "exit"
    abbr -a :qa "exit"

end
