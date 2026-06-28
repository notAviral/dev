return {
    {
        "folke/tokyonight.nvim",
        name = "Tokyonight",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "catppuccin/nvim",
        name = "Catppuccin",
        lazy = false,
        priority = 1000
    },
    {
        "RedsXDD/neopywal.nvim",
        name = "Neopywal",
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
        name = "Pixel",
        lazy = false,
        priority = 1000,
    },
}
