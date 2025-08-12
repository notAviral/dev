#!/bin/bash

# Supported packages
packages=(
        "zsh" "git" "nvim" "hypr"
        "kitty" "wofi" "tmux" "matugen")

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

clear
echo -e "${CYAN}${BOLD}Welcome to MadMonk's Dotfiles Setup!${RESET}\n"

# ASCII Art
echo -e "${BLUE}"
cat <<'EOF'

██████╗░░█████╗░████████╗░██████╗  ███╗░░░███╗░█████╗░███╗░░██╗██╗░░██╗
██╔══██╗██╔══██╗╚══██╔══╝██╔════╝  ████╗░████║██╔══██╗████╗░██║██║░██╔╝
██║░░██║██║░░██║░░░██║░░░╚█████╗░  ██╔████╔██║██║░░██║██╔██╗██║█████═╝░
██║░░██║██║░░██║░░░██║░░░░╚═══██╗  ██║╚██╔╝██║██║░░██║██║╚████║██╔═██╗░
██████╔╝╚█████╔╝░░░██║░░░██████╔╝  ██║░╚═╝░██║╚█████╔╝██║░╚███║██║░╚██╗
╚═════╝░░╚════╝░░░░╚═╝░░░╚═════╝░  ╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═╝░░╚═╝

EOF
echo -e "${RESET}"

confirm() {
        echo -ne "$1 [y/N]: "
        read choice
        [[ "$choice" =~ ^[Yy]$ ]]
}

full_install() {
        cd scripts || exit 1
        for pkg in "${packages[@]}"; do
                script="./install_${pkg}.sh"
                if [[ -x "$script" ]]; then
                        "$script"
                else
                        echo "${YELLOW}[!]${RESET}Warning: $script not found or not executable"
                fi
        done
        cd ..
}

only_install() {
        cd scripts || exit 1
        for pkg in "${packages[@]}"; do
                script="./install_${pkg}.sh"
                if [[ -x "$script" ]]; then
                        "$script" --install
                else
                        echo "${YELLOW}[!]${RESET}Warning: $script not found or not executable"
                fi
        done
        cd ..
}

manual_install() {
        cd scripts || exit 1

        for pkg in "${packages[@]}"; do
                script="./install_${pkg}.sh"
        
                if [[ ! -x "$script" ]]; then
                        echo -e "${YELLOW}[!]${RESET} Warning: $script not found or not executable"
                else
                        if confirm "${CYAN}[?]${RESET} Do you want to install ${BOLD}${pkg}${RESET}?"; then
                                "$script" --install
                        fi

                        if confirm "${CYAN}[?]${RESET} Do you want to update ${BOLD}${pkg}${RESET} config?"; then
                                "$script" --setup
                        fi
                fi
        done
}

install_packages() {
        if [[ "$1" == "--full" ]]; then
                full_install
        elif [[ "$1" == "--install" ]]; then
                only_install
        elif [[ "$1" == "--manual" ]]; then
                manual_install
        fi
}
