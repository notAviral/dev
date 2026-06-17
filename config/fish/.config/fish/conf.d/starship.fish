if status is-interactive

    starship init fish | source 

    set -gx STARSHIP_CONFIG ~/.config/fish/modules/starship.toml

    function starship_transient_prompt_func
        starship module character
    end

    enable_transience

end
