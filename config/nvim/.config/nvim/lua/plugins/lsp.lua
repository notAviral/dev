return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        event = {
            'BufNewFile',
            'BufReadPre',
            "BufReadPost",
            "BufWritePost",
            "InsertLeave"
        },
        dependencies = { 'mfussenegger/nvim-lint' },
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
        event = { 'BufNewFile', 'BufReadPre' },
        opts = {
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true, -- fall back to LSP if no formatter defined above
            },
        },
    },
}
