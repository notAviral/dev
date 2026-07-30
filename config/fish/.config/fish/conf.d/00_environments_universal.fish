set -Ux XDG_CONFIG_HOME ~/.config
set -Ux XDG_DATA_HOME ~/.local/share
set -Ux XDG_STATE_HOME ~/.local/state
set -Ux XDG_CACHE_HOME ~/.cache

set -Ux SECRETS_DIR $HOME/.secrets/
set -Ux NOTES_DIR   $HOME/Notes/

set -Ux SHELL /bin/fish
set -Ux EDITOR nvim

set -Ux GTK_IM_MODULE simple

set -gx NIX_BUILD_SHELL bash
set -gx GPG_TTY (tty)
