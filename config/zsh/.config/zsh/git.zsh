
# Git Aliases
alias lg='lazygit'
alias gd='git diff'
alias gs='git status'
alias ga='git add'
alias gap='git add --patch'
alias gaa='git add .'
alias gc='git commit'
alias gca='git commit -a'
alias gp='git push'
alias gu='git pull'
alias gcl='git clone'
alias gl='git log --graph --all --decorate --date=iso --pretty=format:"%C(auto)%h%Creset %C(bold blue)(%ad)%Creset %C(yellow)%d%Creset%n%C(bold green)Author:%Creset %an <%ae>%n%C(bold red)Committer:%Creset %cn <%ce>%n%C(bold cyan)Message:%Creset %s%n"'

# LazyGit launcher 
lazygit_widget() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    if [ -n "$TMUX" ]; then
      tmux new-window -n lazygit lazygit
    else
      lazygit
    fi
  else
    echo "not a git directory"
  fi
}

zle -N lazygit_widget

# Bind Ctrl+G
bindkey -M emacs '^g' lazygit_widget
bindkey -M vicmd '^g' lazygit_widget
bindkey -M viins '^g' lazygit_widget
