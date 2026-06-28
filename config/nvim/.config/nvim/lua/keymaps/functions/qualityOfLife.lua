-- QoL KeyBinds

-- source the entire file
vim.keymap.set("n", "<leader><leader>r", ":source % <CR>")

-- Escape to Normal mode
vim.keymap.set("i", "<C-l>", "<ESC>", { desc = "Escape from insert mode" })
