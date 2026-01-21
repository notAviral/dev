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
    
    if [ -f "$HOME/Notes/ZettelKasten/$1.md" ]; then
        echo "Note already exists!!"
        nvim "$HOME/Notes/ZettelKasten/$1.md"
    else
        nvim "$HOME/Notes/Inbox/$1.md"
    fi
}

alias of='cd $HOME/Notes/ZettelKasten/'
alias or='nvim $HOME/Notes/Inbox/*.md'
