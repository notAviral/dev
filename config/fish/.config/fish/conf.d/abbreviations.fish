
if status is-interactive 

    abbr -a v "nvim"
    abbr -a e "exit"
    abbr -a c "clear"
    abbr -a t "tmux"

    abbr -a leet "nvim -c Leet"

    abbr -a s "sesh"
    abbr -a sc "sesh connect"

    abbr -a l  "eza -lh"

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

end
