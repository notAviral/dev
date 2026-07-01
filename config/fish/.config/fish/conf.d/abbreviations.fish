
if status is-interactive 

    abbr -a v "vim"
    abbr -a e "exit"
    abbr -a c "clear"
    abbr -a t "tmux"

    abbr -a s "sesh"
    abbr -a sc "sesh connect"

    abbr -a l  "eza -lh"
    abbr -a cd "z"

    abbr -a lg "lazygit"

    abbr -a g "git"

    if command -v pacman >/dev/null then
        if command -v paru >/dev/null then
            abbr -a p "paru"
        else 
            abbr -a p "pacman"
        end
    end

end
