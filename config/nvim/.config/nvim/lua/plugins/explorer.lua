return {
	{
		"stevearc/oil.nvim",
		name = "Oil",
		cmd = "Oil",
		dependencies = {},
		lazy = true,
		opts = {
			default_file_browser = true,
			view_options = {
				show_hidden = true,
			},
			skip_confirm_for_simple_edits = true,
		},
	},
	{
		"mikavilpas/yazi.nvim",
		name = "Yazi",
        lazy = true,
		cmd = "Yazi",
		version = "*",
		dependencies = {
			{ { "nvim-lua/plenary.nvim", lazy = true, name = "Plenary" } },
		},
		opts = {
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
		init = function()
			-- Mark netrw as loaded so it's not loaded at all.
			vim.g.loaded_netrwPlugin = 1
		end,
	},
}
