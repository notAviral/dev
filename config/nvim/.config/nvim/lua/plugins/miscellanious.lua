return {
    {
        "m4xshen/hardtime.nvim",
        enabled = false,
        lazy = false,
        dependencies = { { "MunifTanjim/nui.nvim", name = "NUI" } },
        opts = {},
    },
    {
        "alexghergh/nvim-tmux-navigation",
        lazy = false,
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
    }
}
