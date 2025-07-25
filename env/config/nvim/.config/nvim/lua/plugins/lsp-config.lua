return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
          "ts_ls",
					"arduino_language_server",
					"bashls",
					"ast_grep",
          "zls",
					"tailwindcss",
					"dockerls",
					"grammarly",
					"phpactor",
					"opencl_ls",
					"glsl_analyzer",
          "clangd",
          "pyright",
          "basedpyright"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.arduino_language_server.setup({ capabilities = capabilities } )
			lspconfig.bashls.setup({ capabilities = capabilities } )
			lspconfig.ast_grep.setup({ capabilities = capabilities })
			lspconfig.tailwindcss.setup({ capabilities = capabilities })
			lspconfig.dockerls.setup({ capabilities = capabilities })
			lspconfig.grammarly.setup({ capabilities = capabilities })
			lspconfig.phpactor.setup({ capabilities = capabilities })
			lspconfig.opencl_ls.setup({ capabilities = capabilities })
			lspconfig.glsl_analyzer.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.basedpyright.setup({ capabilities = capabilities })
			lspconfig.zls.setup({ capabilities = capabilities })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "sd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      -- Register custom QML LSP
      lspconfig.configs.qmlls = {
        default_config = {
          cmd = { "qmlls6" },
          filetypes = { "qml" },
          root_dir = require("lspconfig.util").root_pattern(".git", "."),
          single_file_support = true,
        },
      }
      lspconfig.qmlls.setup({ capabilities = capabilities })

		end,
	},
}
