return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")
		treesitter.install({
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
		treesitter.setup({
			highlight = { enabled = true },
		})
	end,
}
