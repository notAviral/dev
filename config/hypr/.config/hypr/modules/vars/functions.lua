--- Functions ---


local M = {}

M.drag = function()
    hl.dispatch(hl.dsp.window.float({ action = "on" }))
    hl.dispatch(hl.dsp.window.drag())
end

return M
