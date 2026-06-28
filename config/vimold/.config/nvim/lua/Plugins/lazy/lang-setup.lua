-- this module provide full support to languages with
-- lsps, formatters, and linters, also providing basic
-- lsp functionalities like auto complete using
-- "saghen/blink.nvim" plugin.
-- The formatters, lsps, and linters are downloaded with
-- mason plugins, and this process is automated by
-- these in "Plugins.config.lang-tools" file

local plugin_config = require("Plugins.config.lang-conf")

return {
	{ -- Mason LSP package manager
		"williamboman/mason.nvim",
		config = plugin_config.mason,
	},
	{ -- Mason LSP Bridge
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = plugin_config.mason_lspconfig,
	},
	{ -- Mason Tool Installer (for formatters/linters)
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local lang_tools = require("Plugins.config.lang-tools")
			local tools_to_install = {}

			-- Collect all formatters and linters from lang-tools
			for lang, tools in pairs(lang_tools) do
				-- Add formatters
				if tools.fmt then
					local formatters = type(tools.fmt) == "table" and tools.fmt or { tools.fmt }
					local mason_names = tools.mason_fmt
							and (type(tools.mason_fmt) == "table" and tools.mason_fmt or { tools.mason_fmt })
						or formatters

					for i, formatter in ipairs(formatters) do
						local mason_name = mason_names[i] or formatter
						if not vim.tbl_contains(tools_to_install, mason_name) then
							table.insert(tools_to_install, mason_name)
						end
					end
				end

				-- Add linters
				if tools.lint then
					local linters = type(tools.lint) == "table" and tools.lint or { tools.lint }
					local mason_names = tools.mason_lint
							and (type(tools.mason_lint) == "table" and tools.mason_lint or { tools.mason_lint })
						or linters

					for i, linter in ipairs(linters) do
						local mason_name = mason_names[i] or linter
						if not vim.tbl_contains(tools_to_install, mason_name) then
							table.insert(tools_to_install, mason_name)
						end
					end
				end
			end

			require("mason-tool-installer").setup({
				ensure_installed = tools_to_install,
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
	{ -- LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = plugin_config.lspconfig,
	},
	{ -- None-ls extras (for eslint_d)
		"nvimtools/none-ls-extras.nvim",
	},
	{ -- Shellcheck for none-ls
		"gbprod/none-ls-shellcheck.nvim",
	},
	{ -- None-ls (null-ls fork)
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvimtools/none-ls-extras.nvim",
			"gbprod/none-ls-shellcheck.nvim",
		},
		config = plugin_config.none_ls,
	},
}
