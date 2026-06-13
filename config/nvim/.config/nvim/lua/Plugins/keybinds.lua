-- Custom variable for vim api
local set = vim.keymap.set

-- NeoTree
set("n", "<BSlash>", "<cmd>Neotree toggle<CR>", { desc = "NeoTree: Open Filetree to left" }) -- spawn a Neotree to the left

-- Oil
set("n", "-", "<cmd>Oil<CR>", { desc = "Oil: Open Parent Directory" })
set({ "n" }, "<leader>e", ":Oil<CR>", { desc = "Oil: Open Explorer as a buffer" })

-- Yazi
set({ "n" }, "<leader>y", "<cmd>Yazi<CR>", { desc = "Yazi: Open Yazi for current file" })
set({ "n" }, "<leader>Y", "<cmd>Yazi cwd<CR>", { desc = "Yazi: Open Yazi for current working Directory" })

-- Telescope
local builtin = require("telescope.builtin")
set("n", "<leader>f", builtin.find_files, { desc = "Telescope: Find Files" })
set("n", "<leader>gg", builtin.live_grep, { desc = "Telescope: Live Grep" })
set("n", "<leader>j", builtin.jumplist, { desc = "Telescope: Jumplists" })
set("n", "<leader>b", builtin.buffers, { desc = "Telescope: Buffers" })
-- set("n", "<leader>c", builtin.commands, { desc = "Telescope: List of Commands" })
set("n", "<leader>d", builtin.diagnostics, { desc = "Telescope: Diagnostics" })
set("n", "<leader>sd", builtin.lsp_definitions, { desc = "Telescope: Definations" })
set("n", "<leader>sr", builtin.lsp_references, { desc = "Telescope: References" })
set("n", "<leader>to", builtin.oldfiles, { desc = "Telescope: Recent Files" })
set("n", "<leader>th", builtin.builtin, { desc = "Telescope: Builtin Pickers" })
set("n", "<leader>sh", ":Telescope help_tags <CR>", { desc = "Telescope: Show Help Tags" })
set("n", "<leader>sk", ":Telescope keymaps <CR>", { desc = "Telescope: Show Keybinds" })
set("n", "<leader>vo", builtin.vim_options, { desc = "Telescope: Vim Options" })

-- LSP Configs
set("n", "D", vim.lsp.buf.hover, { desc = "LSP: Hover" })
set("n", "sd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })

-- Git
set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns: Preview hunk" })
set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Gitsigns: Toggle blame" })

-- VIM tmux Navigations -
set("n", "<M-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { desc = "Tmux: Navigate Left" })
set("n", "<M-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { desc = "Tmux: Navigate Down" })
set("n", "<M-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { desc = "Tmux: Navigate Up" })
set("n", "<M-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { desc = "Tmux: Navigate Right" })

-- Copilot Chat keybinds-
vim.g.copilot_no_tab_map = true
set("i", "<M-Enter>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
	desc = "Copilot: Accept suggestion",
})
set("n", "<leader>cc", ":CopilotChat<CR>", { desc = "Copilot: Chat with copilot" })
set("v", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "Copilot: Explain Code" })
set("v", "<leader>cr", ":CopilotChatReview<CR>", { desc = "Copilot: Riview Code" })
set("v", "<leader>cf", ":CopilotChatFix<CR>", { desc = "Copilot: Code Fixes" })
set("v", "<leader>cd", ":CopilotChatDocs<CR>", { desc = "Copilot: Generate Documentation" })
set("v", "<leader>cT", ":CopilotChatTests<CR>", { desc = "Copilot: Generate Tests" })
set("n", "<leader>cm", ":CopilotChatCommit<CR>", { desc = "Copilot: Generate Messages" })
set("n", "<leader>ct", function()
	if vim.g.copilot_enabled then
		vim.cmd("Copilot disable")
		vim.g.copilot_enabled = false
		print("Copilot disabled")
	else
		vim.cmd("Copilot enable")
		vim.g.copilot_enabled = true
		print("Copilot enabled")
	end
end)

-- Obsidian Keybinds
set("n", "<leader>on", "<cmd>Obsidian new<cr>", { desc = "Obsidian: New note (Inbox)" })
set("n", "<leader>os", "<cmd>Obsidian quick_switch<cr>", { desc = "Obsidian: Find notes" })
set("n", "<leader>og", "<cmd>Obsidian search<cr>", { desc = "Obsidian: Grep notes" })
set("n", "<leader>od", "<cmd>Obsidian today<cr>", { desc = "Obsidian: Today's note" })

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.md",
	callback = function()
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
