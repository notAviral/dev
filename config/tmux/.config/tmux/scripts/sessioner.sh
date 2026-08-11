#!/usr/bin/env bash
# sessioner
# Fuzzy-find a project directory and jump into it, creating a new tmux
# session if needed or switching to it if one's already running. Meant to
# be run inside a tmux floating popup (see tmux.conf binding notes).
#
# Usage:
#   sessioner                 -> opens fzf picker
#   sessioner ~/some/path     -> jumps straight to that dir, no picker

set -euo pipefail

if [[ $# -gt 0 ]]; then
    # Directory passed as an argument: skip the picker entirely.
    if [[ ! -d "$1" ]]; then
        echo "error: '$1' is not a directory" >&2
        exit 1
    fi
    target_dir=$(cd "$1" && pwd)
    session_name=$(basename "$target_dir" | tr . _)
else
    # ── CONFIG ────────────────────────────────────────────────────────────
    SEARCH_DIRS=(
        "$HOME/Development/Projects"
        "$HOME/Development/Playground"
        "$HOME/Development/Builds"
        # "$HOME/.config"
    )
    SEARCH_DEPTH=1
    # ──────────────────────────────────────────────────────────────────────
    declare -A path_map
    display_list=()
    for dir in "${SEARCH_DIRS[@]}"; do
        [[ -d "$dir" ]] || continue
        while IFS= read -r found; do
            name=$(basename "$found")
            path_map["$name"]="$found"
            display_list+=("$name")
        done < <(find "$dir" -mindepth 1 -maxdepth "$SEARCH_DEPTH" -type d 2>/dev/null)
    done

    selection=$(
        printf '%s\n' "${display_list[@]}" \
            | awk '!seen[$0]++' \
            | fzf --prompt="project> " --height=100% --border
    )

    [[ -z "$selection" ]] && exit 0

    target_dir="${path_map[$selection]}"
    session_name=$(echo "$selection" | tr . _)
fi

# ── CREATE IF NEEDED (otherwise we just switch to the existing one below) ─
if ! tmux has-session -t "$session_name" 2>/dev/null; then
    # Window 1: neovim
    tmux new-session -d -s "$session_name" -n "neovim" -c "$target_dir"
    tmux send-keys -t "$session_name:neovim" "nvim" C-m
    # Window 2: shell (fish)
    tmux new-window -t "$session_name" -n "shell" -c "$target_dir"
    tmux send-keys -t "$session_name:shell" "clear" C-m
    # Window 3: runner, split into two vertical panes
    tmux new-window -t "$session_name" -n "runner" -c "$target_dir"
    tmux split-window -h -t "$session_name:runner" -c "$target_dir"
    tmux select-window -t "$session_name:neovim"
fi

# ── SWITCH/ATTACH ───────────────────────────────────────────────────────
if [[ -n "${TMUX:-}" ]]; then
    tmux switch-client -t "$session_name"
else
    tmux attach-session -t "$session_name"
fi
