return {
    {
        "m4xshen/hardtime.nvim",
        name = "Hardtime",
        enabled = false,
        lazy = false,
        dependencies = { { "MunifTanjim/nui.nvim", name = "NUI" } },
        opts = {},
    },
    {
        "alexghergh/nvim-tmux-navigation",
        name = "Tmux-Vim Navigations",
        lazy = false,
        opts = {},
    },
    {
        "numToStr/Comment.nvim",
        name = "Comment",
        lazy = true,
        event = { "BufRead", "BufNewFile" },
        opts = {
            toggler = {
                line = "gcc",
                block = "gbc",
            },
        },
    }
}
