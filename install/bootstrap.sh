#!/bin/bash

# Impottant variables
DOTFILES_DIR="${HOME}/dev"

# bash safety, exit on errors
set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

echo -e "${CYAN}[+]${RESET} Bootstrapping dotfiles setup..."

# check for commands (packages)
has_cmd() {
    command -v "$1" >/dev/null 2>&1
}

# git installer (supports pacman, apt, and dnf)
install_git() {
    if has_cmd git; then
        echo -e "${GREEN}[✓]${RESET} Git is already installed."
        return
    fi

    echo -e "${YELLOW}[~]${RESET} Installing git..."
    if has_cmd pacman; then
        sudo pacman -Syu --noconfirm git
    elif has_cmd apt; then
        sudo apt update && sudo apt install -y git
    elif has_cmd dnf; then
        sudo dnf install -y git
    else
        echo -e "${RED}[✗]${RESET} Unsupported package manager."
        exit 1
    fi
    echo -e "${GREEN}[✓]${RESET} Git installed successfully ..."
}

# Clone dotfiles repo
clone_repo() {
    if [ -d "$DOTFILES_DIR" ]; then
        echo "${YELLOW}[!]${RESET} Dotfiles already cloned at ${CYAN} $DOTFILES_DIR ${RESET}"
    else
        git clone https://github.com/MadMonkDev/dev.git "$DOTFILES_DIR"
        echo "${GREEN}[✓]${RESET} Dotfiles cloned to ${CYAN} $DOTFILES_DIR ${RESET}"
    fi
}

# Run main installer
run_installer() {
    chmod +x "$DOTFILES_DIR/install/installer.sh"
    cd "$DOTFILES_DIR/install/"
    exec ./installer.sh
}

install_git
clone_repo
run_installer
