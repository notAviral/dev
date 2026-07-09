-- Terminal related functionality

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Terminal to normal mode" })

vim.keymap.set("n", "<leader>ht", ":split  | terminal<CR>", { desc = "Open terminal in Horizontal Split" })
vim.keymap.set("n", "<leader>vt", ":vsplit | terminal<CR>", { desc = "Open terminal in Vertical Split" })

vim.keymap.set("n", "<leader>tt", ":tabnew | terminal<CR>", { desc = "Open terminal in New Tab" })

-- Start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "startinsert",
})
