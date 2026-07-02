# Cargo / Rust
set -gx CARGO_HOME "$HOME/.local/share/cargo"
set -gx RUSTUP_HOME "$HOME/.local/share/rustup"

# Go
set -gx GOPATH "$HOME/.local/share/go"
set -gx GOMODCACHE "$HOME/.cache/go/mod"

# Node / npm / nvm
set -gx NPM_CONFIG_CACHE "$HOME/.cache/npm"
set -gx NVM_DIR "$HOME/.local/share/nvm"

# Bun
set -gx BUN_INSTALL "$HOME/.local/share/bun"

# Yarn
set -gx YARN_GLOBAL_FOLDER "$HOME/.local/share/yarn"

# Python
set -gx PYTHONSTARTUP "$HOME/.config/python/startup.py"

# Nimble
set -gx NIMBLE_DIR "$HOME/.local/share/nimble"

# Android / ADB
set -gx ANDROID_HOME "$HOME/.local/share/android"

# Gradle (if you ever use it)
set -gx GRADLE_USER_HOME "$HOME/.local/share/gradle"

# Man pages 
set -gx MANPAGER "less -R  --use-color -Dd+r -Du+b"
