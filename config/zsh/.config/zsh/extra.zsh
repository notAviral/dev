# -------------------------------------- 
# Optional Extras 
# -------------------------------------- 

# Background fastfetch (only outside tmux)
if [[ -z "$TMUX" && -f "$HOME/.config/fastfetch" ]]; then
  (fastfetch &)
fi

# Obsidian Notetaking Workflow
function on {
    if [ -z "$1" ]; then
        echo "Name for the Note needed"
        return 1
    fi
    
    if [ -f "$NOTES_DIR/ZettelKasten/$1.md" ]; then
        echo "Note already exists!!"
        nvim "$NOTES_DIR/ZettelKasten/$1.md"
    else
        nvim "$NOTES_DIR/Inbox/$1.md"
    fi
}

alias oo="cd $NOTES_DIR"
alias or="nvim $NOTES_DIR/Inbox/*.md"
