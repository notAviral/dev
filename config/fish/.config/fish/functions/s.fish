function s
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        git status -sb
    else
        ls -lhAF
    end
end
