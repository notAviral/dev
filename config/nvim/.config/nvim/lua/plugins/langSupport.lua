return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        opts = { install_dir = vim.fn.stdpath("data") .. "/parsers" },
        config = function()
            local parsers = require("core.langTools").parsers
            require("nvim-treesitter").install(parsers)
            vim.treesitter.language.register("markdown", "markdown")
        end,
    },
    {
        "saghen/blink.cmp",
        lazy = true,
        event = "InsertEnter",
        version = "1.*",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
        opts = {
            keymap = {
                preset = "default",
                ["<C-j>"] = { "select_next", "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<CR>"] = { "select_and_accept", "fallback" },

                -- jump forward/backward through snippet nodes
                ["<C-l>"] = { "snippet_forward", "fallback" },
                ["<C-h>"] = { "snippet_backward", "fallback" },
            },
            appearance = {
                nerd_font_variant = "mono",
            },
            completion = {
                documentation = { auto_show = false },
            },
            sources = {
                default = { "lsp", "path", "buffer", "snippets" },
            },
            snippets = {
                preset = "luasnip", -- tell blink to use luasnip as the engine
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            cmdline = {
                enabled = true,
                keymap = { preset = "cmdline" },
                completion = {
                    menu = { auto_show = true },
                },
            },
        },
    },
    {
        "L3MON4D3/LuaSnip",
        lazy = true,
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()

            -- optional: your own snippets
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/snippets" },
            })

            require("luasnip").config.set_config({
                history = true,
                updateevents = "TextChanged,TextChangedI",
                enable_autosnippets = false,
            })
        end,
    },
}
