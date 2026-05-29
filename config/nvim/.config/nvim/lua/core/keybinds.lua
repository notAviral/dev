-- Generic KeyBinds :
local set = vim.keymap.set

-- Copy Pasta KeyBinds :
set({ "n", "v" }, "Y", '"+y', { desc = "Copy to clipboard" })
set({ "n", "v" }, "P", '"+p', { desc = "Paste from clipboard" })
set({ "n", "v" }, "<C-c>", '"+y', { desc = "Copy to clipboard --Control C" })
set({ "n", "v" }, "<C-p", '"+p', { desc = "Paste from clipboard --Control P" })

-- QoL KeyBinds
set("n", "<leader><leader>r", ":source % <CR>") -- source the entire file

-- Buffers motion:
set("n", "<C-j>", ":bnext<CR>", { desc = "Next buffer" })
set("n", "<C-k>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Splits
require("customKeybinds.splits").verticalSplit() -- <leader>vs
require("customKeybinds.splits").horizontalSplit() -- <leader>ss

-- Explorer:

-- Terminal in Vertical Split
set({'n', 'v'}, '<leader>tt', ":vert term . <CR>")
        -- Close the window if the terminal closes
vim.api.nvim_create_autocmd("TermClose", {
    pattern = "*",
    callback = function(ev)
        if vim.bo[ev.buf].buftype == "terminal" then
            vim.cmd("close!")
        end
    end
})
