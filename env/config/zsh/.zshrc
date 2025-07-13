# --------------------------------------
# PATHs / ENVIRONMENT VARIABLES
# --------------------------------------

export PATH="$HOME/.config/tmux/plugins/tmuxifier/bin:$PATH"
export EDITOR=nvim

# --------------------------------------
# Zinit Plugin Manager Setup
# --------------------------------------

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

# --------------------------------------
# Zinit Plugins (lazy loaded)
# --------------------------------------

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting 
zinit light zsh-users/zsh-completions 
zinit light zsh-users/zsh-autosuggestions 
zinit light Aloxaf/fzf-tab 

# OMZ snippets (use only what you need)
zinit snippet OMZL::git.zsh 
zinit snippet OMZP::git 
zinit snippet OMZP::sudo 

# Kubernetes-related snippets only if kubectl is installed
if command -v kubectl &>/dev/null; then
  zinit snippet OMZP::kubectl 
  zinit snippet OMZP::kubectx 
fi

# --------------------------------------
# Completion Setup
# --------------------------------------

autoload -Uz compinit && compinit
zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color -lart $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# --------------------------------------
# Shell Behavior
# --------------------------------------

# Keybindings
bindkey -e
bindkey '^j' history-search-backward
bindkey '^k' history-search-forward

# History configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# --------------------------------------
# Aliases
# --------------------------------------

# Common Aliases :
alias ll='ls --color -lart'
alias ls='exa -la'
alias vim='nvim'
alias c='clear'
alias v='nvim'
alias e='exit'
alias t='tmux'
alias nf='fastfetch'
alias ff='fastfetch'

# Git Aliases:
alias gd='git diff'
alias gs='git status'
alias ga='git add'
alias gap='git add --patch'
alias gaa='git add .'
alias gc='git commit'
alias gp='git push'
alias gu='git pull'
alias gcl='git clone'
alias gl='
git log --graph --all --decorate --date=iso --pretty=format:"%C(auto)%h%Creset %C(bold blue)(%ad)%Creset %C(yellow)%d%Creset%n%C(bold green)Author:%Creset %an <%ae>%n%C(bold red)Committer:%Creset %cn <%ce>%n%C(bold cyan)Message:%Creset %s%n"
'

# --------------------------------------
# Shell Integrations
# --------------------------------------

# Defer fzf shell integration until after prompt shows
eval "$(fzf --zsh)"

# Starship prompt
eval "$(starship init zsh)" 

# --------------------------------------
# Optional: Background fastfetch 
# --------------------------------------

if [[ -z "$TMUX" && -f "$HOME/.config/fastfetch" ]]; then
  (fastfetch &) 
fi
export PATH="$HOME/.local/bin:$PATH"
