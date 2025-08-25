return {
		config = function()
			local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.ast_grep.setup({ capabilities = capabilities })
            lspconfig.basedpyright.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities } )
			lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.arduino_language_server.setup({ capabilities = capabilities } )
			lspconfig.tailwindcss.setup({ capabilities = capabilities })
			lspconfig.dockerls.setup({ capabilities = capabilities })
			lspconfig.grammarly.setup({ capabilities = capabilities })
			lspconfig.phpactor.setup({ capabilities = capabilities })
			lspconfig.opencl_ls.setup({ capabilities = capabilities })
			lspconfig.glsl_analyzer.setup({ capabilities = capabilities })
			lspconfig.zls.setup({ capabilities = capabilities })
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
        end
}
