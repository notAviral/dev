if status is-interactive

    starship init fish | source 

    set -gx STARSHIP_CONFIG "$XDG_CONFIG_HOME/fish/conf.d/starship/starship.toml"

    function starship_transient_prompt_func
        starship module character
    end

    enable_transience

end
