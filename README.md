# Dotfiles

This repository is a personal dotfiles management system powered by [GNU Stow](https://github.com/aspiers/stow), now with an interactive setup script: `installer.sh`.

---

## 🚀 Packages Covered

This repository includes dotfiles/configs for the following packages:

* <a href="https://github.com/neovim/neovim"><img src="https://upload.wikimedia.org/wikipedia/commons/4/4f/Neovim-logo.svg" alt=".[Neovim](https://github.com/neovim/neovim)" height="30"></a> 
* <a href="https://github.com/kovidgoyal/kitty"><img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Kitty%28Terminal-emulator%29.png" alt=".[Kitty](https://github.com/kovidgoyal/kitty)" height="30"></a>
* <a href="https://github.com/tmux/tmux"><img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Tmux_logo.png" alt=".[tmux](https://github.com/tmux/tmux)" height="30"></a> 
* <a href="https://www.zsh.org/"><img src="https://cdn.pixabay.com/photo/2022/05/03/17/44/zsh-7172334_960_720.png" alt=".[Zsh](https://www.zsh.org/)" height="30"></a> 
* [FastFetch](https://github.com/fastfetch-cli/fastfetch)
* <a href="https://github.com/davatorium/rofi/"><img src="https://b.thumbs.redditmedia.com/wsT0qW4NMACMOYCKlaShhcW6_abGbtUYhx51rIyHvNk.png" alt=".[Rofi](https://github.com/davatorium/rofi/)" height="30"></a> 
* [Hyprland](https://github.com/hyprwm/Hyprland)
* <a href="https://ghostty.org/"><img src="https://ghostty.org/_next/static/media/ghostty-wordmark.6a43fa21.svg" alt="[Ghostty](https://github.com/mitchellh/ghostty)" height="30"></a> 
* [Waybar](https://github.com/Alexays/Waybar)

---

## 📦 Installation Using `installer.sh`

Clone this repository into your home directory:

```sh
git clone --depth 1 https://github.com/MadMonkDev/dotfiles ~/dotfiles
cd ~/dotfiles
```

Make the installer executable:

```sh
chmod +x installer.sh
```

Then run the interactive setup:

```sh
./installer.sh
```

This script allows you to:

* Choose your Linux distribution (Arch, Ubuntu, Fedora)
* Select which packages you want to install
* Automatically install dependencies for each package
* Choose to symlink dotfiles even if packages are already installed

All configurations are managed using [GNU Stow](https://github.com/aspiers/stow).

---

## 🔁 Manual Symlinking (Optional)

If you prefer to symlink dotfiles manually using Stow:

1. Make sure `stow` is installed:

   * macOS or Windows (via [Homebrew](https://brew.sh/)):

     ```sh
     brew install stow
     ```
   * Arch Linux:

     ```sh
     sudo pacman -S stow
     ```
   * Ubuntu/Debian:

     ```sh
     sudo apt install stow
     ```

2. Run stow:

   ```sh
   cd ~/dotfiles
   stow <package_name>  # e.g., stow zsh nvim kitty
   ```

---

## ⚙️ How Stow Works

GNU Stow is a symlink farm manager. It allows you to organize dotfiles by package in separate directories and then create symlinks to them in your home directory.

For example, the structure:

```
dotfiles/
├── zsh/
│   └── .zshrc
├── nvim/
│   └── .config/nvim/init.lua
```

Running `stow zsh nvim` will symlink `.zshrc` and the Neovim config to your `$HOME`.

This keeps your dotfile repo clean, organized, and easily maintainable.

---

## 🧩 Adding/Updating Package Dependencies

Dependencies for each package are defined in `installer.sh` using a structured associative array. To add or update dependencies:

```bash
declare -A package_dependencies=(
  ["nvim"]="npm"
  ["zsh"]="tmux fastfetch starship"
  ["hyprland"]="hyprpaper hypridle swww pywal"
)
```

Just modify the relevant line and re-run the installer script.

---

Enjoy your custom Linux environment!
