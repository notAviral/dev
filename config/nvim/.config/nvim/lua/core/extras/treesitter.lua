return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"rust",
			"c",
			"cpp",
			"markdown",
			"markdown_inline",
			"python",
			"toml",
			"java",
			"javascript",
			"lua",
			"bash",
		})
		vim.treesitter.language.register("markdown", "markdown")
	end,
}
