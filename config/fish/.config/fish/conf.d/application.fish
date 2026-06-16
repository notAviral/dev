
if status is-interactive 

    # Zoxide support:
    zoxide init fish | source

    # Fzf support:
    fzf --fish | source

    # Direnv support:
    direnv hook fish | source

end
