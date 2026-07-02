-- Defination Hover
local M = {}

function M.on_attach(client, bufnr)
    local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- navigation
    map({ "n", "v" }, "gd", vim.lsp.buf.definition, "LSP: Go to definition")
    map({ "n", "v" }, "gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
    map({ "n", "v" }, "gi", vim.lsp.buf.implementation, "LSP: Go to implementation")
    map({ "n", "v" }, "gr", vim.lsp.buf.references, "LSP: References")
    map({ "n", "v" }, "gy", vim.lsp.buf.type_definition, "LSP: Go to type definition")

    -- info
    map({ "n", "v" }, "K", vim.lsp.buf.hover, "LSP: Hover docs")
    map({ "n", "v", "i" }, "<C-s>", vim.lsp.buf.signature_help, "LSP: Signature help")

    -- actions
    map({ "n", "v", "x" }, "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")

    -- diagnostics
    map("n", "<leader>d", vim.diagnostic.open_float, "LSP: Line diagnostics")
    map("n", "<leader>q", vim.diagnostic.setloclist, "LSP: Diagnostic list")

    -- format on save
    if client:supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false, bufnr = bufnr })
            end,
        })
    end

    -- highlight word under cursor
    if client:supports_method("textDocument/documentHighlight") then
        local group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = false })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = bufnr,
            group = group,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = bufnr,
            group = group,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

return M
