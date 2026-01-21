vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = vim.fn.expand("~") .. "/Notes/**/*.md",
	callback = function()
		vim.diagnostic.disable(0)
	end,
})
