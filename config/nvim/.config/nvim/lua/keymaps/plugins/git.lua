--- Git Keymaps ---

local neogit = require("neogit")
local gitsign = require("gitsigns")

-- Neogit
vim.keymap.set("n", "<leader>ng", neogit.open, { desc = "Neogit: Open UI" })

-- Gitsigns
vim.keymap.set("n", "<leader>glb", gitsign.toggle_current_line_blame, { desc = "Gitsigns: Toggle line blame"})
vim.keymap.set("n", "<leader>gb", gitsign.blame, { desc = "Gitsigns: Blame"})
