return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"javascript",
				"java",
				"rust",
				"c",
				"cpp",
				"css",
				"bash",
				"asm",
				"go",
				"toml",
				"typescript",
				"python",
				"sql",
				"zig",
				"php",
				"vim",
				"vimdoc",
				"markdown_inline",
				"arduino",
			},
			auto_install = true,
			highlight = {
				enable = true,
				-- Disable for very large files
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		})
	end,
}
