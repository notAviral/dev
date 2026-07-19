
if status is-interactive 

    # Zoxide support:
    if type -q zoxide
        zoxide init fish | source
    end

    # Fzf support:
    if type -q fzf
        fzf --fish | source
    end

    # Direnv support:
    if type -q direnv
        direnv hook fish | source
    end

    # mise support
    $HOME/.local/bin/mise activate fish | source
end
