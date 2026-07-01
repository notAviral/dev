local builtin = require("telescope.builtin")

-- Main File Navigations
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope: Find Files" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Telescope: Live Grep" })
vim.keymap.set("n", "<leader>gg", builtin.live_grep, { desc = "Telescope: Live Grep" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope: Buffers" })

-- Custom Grep
vim.keymap.set("n", "<leader>tw", function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word })
end, { desc = "Telescope: Grep word under Cursor" })
vim.keymap.set("n", "<leader>tW", function()
    local word = vim.fn.expand("<cWORD>")
    builtin.grep_string({ search = word })
end, { desc = "Telescope: Grep word under Cursor" })
vim.keymap.set("n", "<leader>ten", function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Open Neovim Configs" })

-- Other Navigations
vim.keymap.set("n", "<leader>to", builtin.oldfiles, { desc = "Telescope: Recent Files" })
vim.keymap.set("n", "<leader>tj", builtin.jumplist, { desc = "Telescope: Jumplists" })

-- Vim Help Pickers
vim.keymap.set("n", "<leader>th", builtin.builtin, { desc = "Telescope: Builtin Pickers" })
vim.keymap.set("n", "<leader>sh", ":Telescope help_tags <CR>", { desc = "Telescope: Show Vim Help Tags" })
vim.keymap.set("n", "<leader>sk", ":Telescope keymaps <CR>", { desc = "Telescope: Show Keybinds" })
vim.keymap.set("n", "<leader>vc", builtin.commands, { desc = "Telescope: Commands" })
vim.keymap.set("n", "<leader>vo", builtin.vim_options, { desc = "Telescope: Vim Options" })
