-- File: lua/plugins/lazy/obsidian.lua
return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	lazy = false, -- Load immediately
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"Thiago4532/mdmath.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("Plugins.config.obsidian")
	end,
}
