return {
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = { "Neotree" },
                },
                ignore_focus = { "Neotree" },
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "filename" },
                lualine_x = {},
                lualine_y = { "diff" },
                lualine_z = { "location" },
            },
            extensions = { "oil", "lazy", "mason" },
        },
    },
    {
        "brenoprata10/nvim-highlight-colors",
        lazy = true,
        event = { "BufRead", "BufNewFile" },
        opts = {
            render = "virtual",
            virtual_symbol = " ",
        },
    },
    {
        "xiyaowong/transparent.nvim",
        lazy = true,
        cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" },
        priorty = 1000,
    }
}
