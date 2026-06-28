return {
	{
		"NeogitOrg/neogit",
		name = "Neogit",
		lazy = true,
		cmd = "Neogit",
		dependencies = {
            { "sindrets/diffview.nvim", name = "Diffview", cmd = { "DiffviewOpen", "DiffviewClose" }, lazy = true, },
            { "m00qek/baleia.nvim", name = "Baleia", lazy = true, },
            { "nvim-telescope/telescope.nvim", name = "Telescope", lazy = true, },
		},
	},
    {
        "lewis6991/gitsigns.nvim",
        name = "Gitsigns",
        lazy = true,
        event = "VeryLazy",
        opts = {
            signs = {
                add          = { text = "+" },
                change       = { text = "*" },
                delete       = { text = "-" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
                untracked    = { text = "?" },
            },
            signs_staged = {
                add          = { text = "+" },
                change       = { text = "*" },
                delete       = { text = "-" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
                untracked    = { text = "?" },
            },
        },
    },
}
