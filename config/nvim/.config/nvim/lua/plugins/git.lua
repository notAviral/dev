return {
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        keys = {
            {
                "<leader>ng",
                function()
                    require("neogit").open()
                end,
                desc = "Neogit: Open UI",
            },
        },
        dependencies = {
            "sindrets/diffview.nvim",
            "m00qek/baleia.nvim",
        },
    },

    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        keys = {
            {
                "<leader>glb",
                function()
                    require("gitsigns").toggle_current_line_blame()
                end,
                desc = "Gitsigns: Toggle Line Blame",
            },
            {
                "<leader>gb",
                function()
                    require("gitsigns").blame()
                end,
                desc = "Gitsigns: Blame",
            },
        },
        opts = {
            signs = {
                add          = { text = "+" },
                change       = { text = "!" },
                delete       = { text = "-" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
                untracked    = { text = "?" },
            },
            signs_staged = {
                add          = { text = "+" },
                change       = { text = "!" },
                delete       = { text = "-" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
                untracked    = { text = "?" },
            },
        },
    },
}
