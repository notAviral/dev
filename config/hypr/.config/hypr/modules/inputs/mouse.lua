hl.config({

    input = {
        -- Mouse
        follow_mouse = 1,
        sensitivity = 0,
        accel_profile = "",
        -- force_no_accel = true,
        left_handed = false,

        -- Touchpad
        touchpad = {
            disable_while_typing = true,
            natural_scroll = true,
        },
    },

    -- Miscellaneous
    cursor = {
        -- Prevent NVIDIA from spawning extra cursor
        no_hardware_cursors = 0,
    },

    binds = {
        drag_threshold = 10, -- pixels
    },
})
