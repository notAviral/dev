vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function(args)
		vim.diagnostic.enable(false, { bufnr = args.buf })
	end,
})
-- in your init.lua or a separate file
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function(args)
		vim.treesitter.start(args.buf, "markdown")
	end,
})
