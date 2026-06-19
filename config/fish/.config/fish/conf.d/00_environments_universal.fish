set -Ux XDG_HOME_CONFIG ~/.config
set -Ux XDG_HOME_CACHE  ~/.cache

set -Ux SECRETS_DIR $HOME/.secrets/
set -Ux NOTES_DIR   $HOME/Notes/

set -Ux SHELL /bin/fish
set -Ux EDITOR nvim

set -Ux GTK_IM_MODULE simple

set -gx NIX_BUILD_SHELL bash
