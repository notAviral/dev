return {
	"mikavilpas/yazi.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
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
}
