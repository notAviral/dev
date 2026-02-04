local M = {}

-- Load language tools configuration
local lang_tools = require("Plugins.config.lang-tools")

-- Mason setup
function M.mason()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
			check_outdated_package_on_open = true,
			border = "single",
			backdrop = 80,
			width = 0.75,
			height = 0.60,
		},
	})
end

-- Mason LSP Config setup
function M.mason_lspconfig()
	-- Collect all LSP servers (using lspconfig names)
	local lsp_servers = {}

	for lang, tools in pairs(lang_tools) do
		if tools.lsp then
			if type(tools.lsp) == "table" then
				for _, server in ipairs(tools.lsp) do
					if not vim.tbl_contains(lsp_servers, server) then
						table.insert(lsp_servers, server)
					end
				end
			else
				if not vim.tbl_contains(lsp_servers, tools.lsp) then
					table.insert(lsp_servers, tools.lsp)
				end
			end
		end
	end

	-- mason-lspconfig automatically handles the name conversion
	require("mason-lspconfig").setup({
		ensure_installed = lsp_servers,
		automatic_installation = true,
	})
end

-- LSP Config setup
-- LSP Config setup
function M.lspconfig()
	-- Setup each LSP server with its config
	for lang, tools in pairs(lang_tools) do
		if tools.lsp then
			local servers = type(tools.lsp) == "table" and tools.lsp or { tools.lsp }

			for _, server in ipairs(servers) do
				local config = vim.deepcopy(tools.lsp_config or {})

				-- Add blink.cmp capabilities
				local has_blink, blink = pcall(require, "blink.cmp")
				if has_blink then
					config.capabilities = blink.get_lsp_capabilities(config.capabilities)
				end

				-- Use vim.lsp.config instead of lspconfig
				local ok = pcall(vim.lsp.config, server, config)
				if ok then
					vim.lsp.enable(server)
				else
					vim.notify(string.format("LSP server '%s' configuration failed", server), vim.log.levels.WARN)
				end
			end
		end
	end
end

-- None-ls (null-ls) setup
function M.none_ls()
	local null_ls = require("null-ls")
	local builtin = null_ls.builtins

	local sources = {}

	-- Collect formatters and linters
	for lang, tools in pairs(lang_tools) do
		-- Add formatters
		if tools.fmt then
			local formatters = type(tools.fmt) == "table" and tools.fmt or { tools.fmt }
			for _, formatter in ipairs(formatters) do
				if builtin.formatting[formatter] then
					table.insert(sources, builtin.formatting[formatter])
				else
					-- Only warn if it's not a known LSP-handled formatter
					if formatter ~= "rustfmt" and formatter ~= "zigfmt" then
						vim.notify(
							string.format("Formatter '%s' not found in none-ls builtins", formatter),
							vim.log.levels.DEBUG
						)
					end
				end
			end
		end

		-- Add linters/diagnostics
		if tools.lint then
			local linters = type(tools.lint) == "table" and tools.lint or { tools.lint }
			for _, linter in ipairs(linters) do
				-- Handle special cases that require external plugins
				if linter == "eslint_d" then
					-- eslint_d is in none-ls-extras.nvim
					table.insert(sources, require("none-ls.diagnostics.eslint_d"))
				elseif linter == "shellcheck" then
					-- shellcheck is in none-ls-shellcheck.nvim
					table.insert(sources, require("none-ls-shellcheck.diagnostics"))
					table.insert(sources, require("none-ls-shellcheck.code_actions"))
				elseif builtin.diagnostics[linter] then
					table.insert(sources, builtin.diagnostics[linter])
				else
					-- Only warn if it's not a known LSP-handled linter
					if linter ~= "clippy" and linter ~= "nil_ls" then
						vim.notify(
							string.format("Linter '%s' not found in none-ls builtins", linter),
							vim.log.levels.DEBUG
						)
					end
				end
			end
		end
	end

	-- Setup null-ls
	null_ls.setup({
		sources = sources,
		debug = false,
		on_attach = function(client, bufnr)
			-- Auto-format on save
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("NullLsFormatter", { clear = true }),
					buffer = bufnr,
					callback = function()
						if vim.bo.filetype ~= "markdown" then
							vim.lsp.buf.format()
						end
					end,
				})
			end
		end,
	})
end

return M
