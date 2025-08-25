-- Custom variable for vim api
local set = vim.keymap.set

-- NeoTree 
set ("n", "<BSlash>", "<cmd>Neotree toggle<CR>") -- spawn a Neotree to the right
set ("n", "<leader>nt", "<cmd>Neotree buffers reveal float<CR>") -- spawns a floating buffer

-- Telescope 
local builtin = require('telescope.builtin')
set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' }) -- find files
set('n', '<leader>gg', builtin.live_grep, { desc = 'Telescope live grep' }) -- grep
set('n', '<leader>tb', builtin.buffers, { desc = 'Telescope buffers' }) -- show buffers
set("n", "<leader>to", builtin.oldfiles, { desc = "Recent Files" }) -- Recent files
set("n", "<leader>tc", builtin.commands, { desc = "List of Commands" }) -- show commands
set("n", "<leader>sd", builtin.lsp_references, { desc = "Definations" }) -- show Definations
set("n", "<leader>d", builtin.diagnostics, { desc = "Diagnostics" }) -- show diagnostics
set("n", "<leader>th", builtin.builtin, { desc = "Builtin Pickers" }) -- show Pickers

-- LSP Configs 
set("n", "D", vim.lsp.buf.hover, {})
set("n", "sd", vim.lsp.buf.definition, {})
set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Git
set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

-- VIM tmux Navigations -
set("n", "<leader>h", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
set("n", "<leader>l", "<Cmd>NvimTmuxNavigateRight<CR>", {})
set("n", "<M-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
set("n", "<M-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
set("n", "<M-k>", "<Cmd>NvimTmuxNavigateUp<CR>", {})
set("n", "<M-l>", "<Cmd>NvimTmuxNavigateRight<CR>", {})
