return {
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        priority = 1000,
    },
    {
        "rose-pine/neovim",
        name = "rosepine",
        lazy = true,
        priority = 1000,
        opts = {
            style = { transparency = true },
        },
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        priority = 1000,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = true,
        priority = 1000,
    },
    {
        "RedsXDD/neopywal.nvim",
        lazy = true,
        priority = 1000,
        opts = {
            use_palette = "wallust",
            transparent_background = true,
            defualt_fileformats = true,
            plugins = { markdown = true },
        },
    },
    {
        "bjarneo/pixel.nvim",
        lazy = true,
        priority = 1000,
    },
}
