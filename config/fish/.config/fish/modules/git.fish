# Git command abbreviation
abbr -a g git

# Only expand git sub-command abbreviations when they're the first arg to `git`
function __git_first_arg_abbr
    set -l tokens (commandline -opc)
    # tokens should be exactly ["git", "<this abbreviation>"]
    test (count $tokens) -eq 2 -a "$tokens[1]" = git
    or return 1

    switch $argv[1]
        case st
            echo status
        case c
            echo commit
        case cm
            echo "commit -m"
        case a
            echo add
        case aa
            echo "add ."
        case co
            echo checkout
        case b
            echo branch
        case s
            echo switch
        case d
            echo diff
        case p
            echo push
        case u
            echo "pull --rebase"
    end
end

abbr -a git_subcmds --position anywhere \
    --regex '^(st|c|cm|a|aa|co|b|s|d|p|u)$' \
    --function __git_first_arg_abbr
