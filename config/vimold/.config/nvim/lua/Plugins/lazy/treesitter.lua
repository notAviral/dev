return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"rust",
			"c",
			"go",
			"cpp",
			"markdown",
			"markdown_inline",
			"latex",
			"python",
			"toml",
			"yaml",
			"java",
			"javascript",
			"lua",
			"bash",
		})
		vim.treesitter.language.register("markdown", "markdown")
	end,
}
