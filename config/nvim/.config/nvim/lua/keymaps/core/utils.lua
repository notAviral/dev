-- Escape to normal mode
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape to Normal mode" })
vim.keymap.set("i", "<C-d>", "<Esc>", { desc = "Escape to Normal mode" })

-- Copy Pasta KeyBinds :
vim.keymap.set({ "v", "x" }, "Y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "v", "x" }, "P", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set({ "v", "x" }, "<C-c>", '"+y', { desc = "Copy to clipboard --Control C" })
vim.keymap.set({ "v", "x" }, "<C-p", '"+p', { desc = "Paste from clipboard --Control P" })

-- Move selected text up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})
