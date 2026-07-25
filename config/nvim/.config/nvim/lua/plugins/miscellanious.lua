return {
    {
        "m4xshen/hardtime.nvim",
        enabled = true,
        lazy = true,
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            disabled_filetypes = {
                ["leetcode.nvim"] = true,
            },
            max_time = 1000,
            max_count = 5,
        },
    },
    {
        "alexghergh/nvim-tmux-navigation",
        lazy = true,
        keys = {
            {
                "<M-h>",
                "<Cmd>NvimTmuxNavigateLeft<CR>",
                desc = "Tmux: Navigate Left",
            },
            {
                "<M-j>",
                "<Cmd>NvimTmuxNavigateDown<CR>",
                desc = "Tmux: Navigate Down",
            },
            {
                "<M-k>",
                "<Cmd>NvimTmuxNavigateUp<CR>",
                desc = "Tmux: Navigate Up",
            },
            {
                "<M-l>",
                "<Cmd>NvimTmuxNavigateRight<CR>",
                desc = "Tmux: Navigate Right",
            },
        },
        opts = {},
    },
    {
        "numToStr/Comment.nvim",
        lazy = true,
        event = { "BufRead", "BufNewFile" },
        opts = {
            toggler = {
                line = "gcc",
                block = "gbc",
            },
        },
    },
    {
        "cushycush/quickshell-completions.nvim",
        ft = "qml",
        dependencies = { "saghen/blink.cmp" },
        opts = {},
    },
}
