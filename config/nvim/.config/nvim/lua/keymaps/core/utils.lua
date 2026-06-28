
-- Copy Pasta KeyBinds :
vim.keymap.set({ "n", "v" }, "Y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "v" }, "P", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<C-c>", '"+y', { desc = "Copy to clipboard --Control C" })
vim.keymap.set({ "n", "v" }, "<C-p", '"+p', { desc = "Paste from clipboard --Control P" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})

