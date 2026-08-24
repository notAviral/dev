return {
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        lazy = true,
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
            keymaps = {
                ["<C-v>"] = { "actions.select", opts = { vertical = true } },
                ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
            },
            skip_confirm_for_simple_edits = true,
        },
    },
}
