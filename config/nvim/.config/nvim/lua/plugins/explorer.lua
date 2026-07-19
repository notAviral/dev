return {
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        lazy = false,
        keys = {
            {
                "-",
                "<cmd>Oil<CR>",
                desc = "Oil: Open Parent Directory",
            },
            {
                "<leader>e",
                "<cmd>Oil<CR>",
                desc = "Oil: Open Explorer as a Buffer",
            },
        },
        opts = {
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
            },
            skip_confirm_for_simple_edits = true,
        },
    },
}
