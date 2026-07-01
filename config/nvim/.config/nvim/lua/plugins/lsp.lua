return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        dependencies = { 'mfussenegger/nvim-lint', name = "VimLint" },
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
                check_outdated_package_on_open = true,
                border = nil,
                backdrop = 80,
                width = 1.0,
                height = 1.0,
            },
        },
    },
    {
        'stevearc/conform.nvim',
        opts = {
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true, -- fall back to LSP if no formatter defined above
            },
        },
    },
}
