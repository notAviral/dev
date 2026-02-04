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
set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" }) -- show buffers
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

-- Obsidian Keybinds
local obsidian = require("obsidian")

set("n", "<leader>on", "<cmd>Obsidian new<cr>", { desc = "Obsidian: New note (Inbox)" })
set("n", "<leader>os", "<cmd>Obsidian quick_switch<cr>", { desc = "Obsidian: Find notes" })
set("n", "<leader>og", "<cmd>Obsidian search<cr>", { desc = "Obsidian: Grep notes" })
set("n", "<leader>od", "<cmd>Obsidian today<cr>", { desc = "Obsidian: Today's note" })

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.md",
	callback = function(args)
		local buf = args.buf
		local file = vim.api.nvim_buf_get_name(buf)

		-- Navigations
		set("n", "<leader>of", "<cmd>Obsidian follow_link<cr>", { desc = "Obsidian: Follow link" })
		set("n", "<leader>ob", "<cmd>Obsidian backlinks<cr>", { desc = "Obsidian: Backlinks" })
		set("n", "<leader>oT", "<cmd>Obsidian tags<cr>", { desc = "Obsidian: Tags" })

		-- Note Management
		set("n", "<leader>ot", "<cmd>Obsidian template<cr>", { desc = "Obsidian: Insert template" })
		set("n", "<leader>or", "<cmd>Obsidian rename<cr>", { desc = "Obsidian: Rename note" })

		-- Inbox Workflow
		set(
			"n",
			"<leader>ok",
			"<cmd>!mv '%:p' $HOME/Notes/ZettelKasten/<cr> <cmd>bd<cr>",
			{ desc = "Obsidian: Keep (move to ZettelKasten)" }
		)
		set("n", "<leader>odd", "<cmd>!rm '%:p'<cr> <cmd>bd<cr>", { desc = "Obsidian: Delete note" })

		-- Linking
		set({ "n", "v" }, "<leader>ol", "<cmd>Obsidian link<cr>", { desc = "Obsidian: Link to note" })
		set("v", "<leader>oL", "<cmd>Obsidian link_new<cr>", { desc = "Obsidian: Create new linked note" })

		-- Utilities
		set("n", "<leader>oo", "<cmd>Obsidian open<cr>", { desc = "Obsidian: Open in app" })
		set("n", "<leader>oc", function()
			return require("obsidian").util.toggle_checkbox()
		end, { desc = "Obsidian: Toggle checkbox" })
	end,
})
