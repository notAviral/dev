-- QoL KeyBinds

vim.keymap.set("n", "<leader>x", ":source % <CR>", { desc = "QOL: Source Current Buffer" })
vim.keymap.set("n", "<leader><leader>r", ":restart<cr>", { desc = "QOL: Restart Neovim" })

-- Better defaults 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
