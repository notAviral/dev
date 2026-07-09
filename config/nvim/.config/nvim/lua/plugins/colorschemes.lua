return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        priority = 1000
    },
    {
        "rose-pine/neovim",
        name = "rosepine",
        priority = 1000,
        opts = {
            style = {
                transparency = true,
            }
        }
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
    },
    {
        'nvim-mini/mini.base16',
        priority = 1000,
        config = function()
            --Import custom colorscheme
            require("assets.matugen")
        end
    },
    {
        "RedsXDD/neopywal.nvim",
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
        priority = 1000,
    },
}
