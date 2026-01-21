-- Custom variable for vim api
local set = vim.keymap.set

-- NeoTree
set("n", "<BSlash>", "<cmd>Neotree toggle<CR>") -- spawn a Neotree to the right

-- Oil
set("n", "-", "<cmd>Oil<CR>", { desc = "Open Parent Directory" }) -- i think you know what it do

-- Telescope
local builtin = require("telescope.builtin")
set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" }) -- find files
set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" }) -- grep
set("n", "<leader>tb", builtin.buffers, { desc = "Telescope buffers" }) -- show buffers
set("n", "<leader>to", builtin.oldfiles, { desc = "Recent Files" }) -- Recent files
set("n", "<leader>tc", builtin.commands, { desc = "List of Commands" }) -- show commands
set("n", "<leader>sd", builtin.lsp_references, { desc = "Definations" }) -- show Definations
set("n", "<leader>d", builtin.diagnostics, { desc = "Diagnostics" }) -- show diagnostics
set("n", "<leader>th", builtin.builtin, { desc = "Builtin Pickers" }) -- show Pickers
set("n", "<leader>sh", ":Telescope help_tags <CR>") -- Show Help Documentation
set("n", "<leader>sk", ":Telescope keymaps <CR>") -- Show all KeyBinds

-- LSP Configs
set("n", "D", vim.lsp.buf.hover, {})
set("n", "sd", vim.lsp.buf.definition, {})
set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Git
set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

-- VIM tmux Navigations -
set("n", "<M-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
set("n", "<M-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
set("n", "<M-k>", "<Cmd>NvimTmuxNavigateUp<CR>", {})
set("n", "<M-l>", "<Cmd>NvimTmuxNavigateRight<CR>", {})

-- Copilot Chat keybinds-
set("n", "<leader>cc", ":CopilotChat<CR>", { desc = "Chat with copilot" })
set("v", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "Explain Code" })
set("v", "<leader>cr", ":CopilotChatReview<CR>", { desc = "Riview Code" })
set("v", "<leader>cf", ":CopilotChatFix<CR>", { desc = "Code Fixes" })
set("v", "<leader>cd", ":CopilotChatDocs<CR>", { desc = "Generate Documentation" })
set("v", "<leader>ct", ":CopilotChatTests<CR>", { desc = "Generate Tests" })
set("n", "<leader>cm", ":CopilotChatCommit<CR>", { desc = "Generate Messages" })

-- ========================================
-- Obsidian Keybinds
-- ========================================

-- Search & Navigation
set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Obsidian: Find notes" })
set("n", "<leader>og", "<cmd>ObsidianSearch<cr>", { desc = "Obsidian: Grep notes" })
set("n", "<leader>ol", "<cmd>ObsidianFollowLink<cr>", { desc = "Obsidian: Follow link" })
set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Obsidian: Backlinks" })

-- Note Management
set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Obsidian: New note (Inbox)" })
set("n", "<leader>ot", "<cmd>ObsidianTemplate<cr>", { desc = "Obsidian: Insert template" })
set("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = "Obsidian: Rename note" })

-- Inbox Workflow
set("n", "<leader>ok", "<cmd>lua obsidian_keep_note()<cr>", { desc = "Obsidian: Keep (move to ZettelKasten)" })
set("n", "<leader>odd", "<cmd>lua obsidian_delete_note()<cr>", { desc = "Obsidian: Delete note" })

-- Linking
set("n", "<leader>os", "<cmd>ObsidianLink<cr>", { desc = "Obsidian: Link to note" })
set("v", "<leader>oL", "<cmd>ObsidianLinkNew<cr>", { desc = "Obsidian: Create new linked note" })
set("v", "<leader>oe", "<cmd>ObsidianExtractNote<cr>", { desc = "Obsidian: Extract to new note" })

-- Utilities
set("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = "Obsidian: Open in app" })
set("n", "<leader>od", "<cmd>ObsidianToday<cr>", { desc = "Obsidian: Today's note" })
set("n", "<leader>oc", function()
	return require("obsidian").util.toggle_checkbox()
end, { desc = "Obsidian: Toggle checkbox" })
