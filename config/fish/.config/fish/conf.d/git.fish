if status is-interactive
    
    if not type -q git 
        set_color yellow
        echo "[WARNING] Git not available."
        echo "[WARNING] Please install git for your OS" 
        set_color normal 
    else 
        abbr -a g git

        # Git sub abbriviations
        abbr -c git st "status"

        abbr -c git c "commit"
        abbr -c git cm "commit -m"

        abbr -c git a "add"
        abbr -c git aa "add ."

        abbr -c git co "checkout"
        
        abbr -c git b "branch"

        abbr -c git s "switch"

        abbr -c git d "diff"

        abbr -c git p "push"
        abbr -c git u "pull --rebase"
    end

end
