return {
	"nvim-telescope/telescope.nvim",
	name = "Telescope",
    cmd = "Telescope",
	lazy = true,
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		defaults = {
			layout_strategy = "horizontal",
			prompt_prefix = " > ",
			selection_caret = " ▸ ",
			file_ignore_patterns = {
				"node_modules",
				"dist",
				"build",
				"%.git/",
			},
			dynamic_preview_title = true,
			mappings = {
				i = {
					["<C-j>"] = require("telescope.actions").move_selection_next,
					["<C-k>"] = require("telescope.actions").move_selection_previous,
				},
			},
		},
		pickers = {
			find_files = {
				hidden = true,
			},
			live_grep = {
				hidden = true,
			},
		},
	},
}
