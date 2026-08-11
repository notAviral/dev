hl.config({
    decoration = {
        rounding = 10,
        rounding_power = 1.5,

        -- Transparency :
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1.0,

        dim_modal = true,
        dim_inactive = false,
        dim_strength = 0.5,
        dim_around = 0.4,

        -- screen_shader = <path/to/shader.frag>,

        border_part_of_window = false,
    },
})

-- Workaround for fullscreen centering issue
hl.on("window.fullscreen", function(win, isFullscreen)
    local _ = win
    if not isFullscreen then
        hl.dispatch(hl.dsp.window.center())
    end
end)
