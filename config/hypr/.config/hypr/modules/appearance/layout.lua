hl.config({
    general = {
        layout = "scrolling"
    }
})
if hl.get_config("general.layout") == "scrolling" then
    hl.config({

        scrolling = {
            fullscreen_on_one_column = true,
            column_width = 0.8,

            focus_fit_method = 1,
            follow_focus = true,

            follow_min_visible = 0.4,
        }
    })
end
