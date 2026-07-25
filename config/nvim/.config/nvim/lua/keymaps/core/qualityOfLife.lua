-- QoL KeyBinds

vim.keymap.set("n", "<leader>x", ":source % <CR>", { desc = "QOL: Source Current Buffer" })
vim.keymap.set("n", "<leader><leader>r", ":restart<cr>", { desc = "QOL: Restart Neovim" })

-- Better defaults
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")

vim.keymap.set("n", "<C-,>", ":silent! tabprevious<CR>")
vim.keymap.set("n", "<C-.>", ":silent! tabnext<CR>")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("c", "<C-j>", "<C-n>")
vim.keymap.set("c", "<C-k>", "<C-p>")
