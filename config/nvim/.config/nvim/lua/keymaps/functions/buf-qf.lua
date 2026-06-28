-- Buffers / Quickfix list motion:
local function quickfix_open()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].buftype == "quickfix" then
            return true
        end
    end
    return false
end

vim.keymap.set("n", "<C-k>", function()
    if quickfix_open() then
        vim.cmd("cprev")
    else
        vim.cmd("bprev")
    end
end, { desc = "Buffer / Quickfix Prev" })

vim.keymap.set("n", "<C-j>", function()
    if quickfix_open() then
        vim.cmd("cnext")
    else
        vim.cmd("bnext")
    end
end, { desc = "Buffer / Quickfix Next" })
