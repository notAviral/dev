local tools = require("core.langSpecs")

require("conform").setup({
    formatters_by_ft = tools.formatters,
})

require("lint").linters_by_ft = tools.linters

-- Triggers
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

vim.lsp.config("*", {
    on_attach = require("keymaps.core.lsp").on_attach,
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true,
                    resolveSupport = {
                        properties = { "documentation", "detail", "additionalTextEdits" },
                    },
                },
            },
        },
    },
})

vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
        source = "if_many",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
})

vim.lsp.enable(tools.servers)
