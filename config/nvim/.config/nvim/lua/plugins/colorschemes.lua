return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000
    },
    {
        "RedsXDD/neopywal.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            use_palette = "wallust",
            transparent_background = true,
            defualt_fileformats = true,
            plugins = {
                markdown = true,
            },
        },
    },
    {
        "bjarneo/pixel.nvim",
        lazy = false,
        priority = 1000,
    },
}
