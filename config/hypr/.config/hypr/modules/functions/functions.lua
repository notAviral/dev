--- Functions ---


local M = {}

M.drag = function()
    hl.dispatch(hl.dsp.window.float({ action = "on" }))
    hl.dispatch(hl.dsp.window.drag())
end

M.float = function(action)
    hl.dispatch(hl.dsp.window.float({ action = action }))

    local win = hl.get_active_window()
    if win ~= nil and win.floating then
        local mon = win.monitor
        if mon ~= nil then
            hl.dispatch(hl.dsp.window.resize({
                x = math.floor(mon.width * 0.45),
                y = math.floor(mon.height * 0.6),
                relative = false,
            }))
        else
            hl.dispatch(hl.dsp.window.resize({ x = 1152, y = 648, relative = false })) -- fallback
        end
        hl.dispatch(hl.dsp.window.center())
    end
end

return M
