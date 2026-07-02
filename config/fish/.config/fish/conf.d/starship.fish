if status is-interactive
    if not type -q starship
        set_color yellow
        echo "[WARNING] Starship not available."
        set_color green
        echo "[INSTALL] Installing Starship..."
        set_color normal

        curl -sS https://starship.rs/install.sh | sh

        set_color green
        echo "[INSTALL] Installation complete."
        set_color normal
    else
        set -gx STARSHIP_CONFIG ~/.config/fish/modules/starship.toml

        starship init fish | source

        function starship_transient_prompt_func
            starship module character
        end

        enable_transience
    end
end
