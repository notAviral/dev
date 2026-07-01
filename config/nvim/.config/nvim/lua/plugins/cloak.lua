return {
    "laytan/cloak.nvim",
    lazy = false,
    priority = 500,
    dependecies = {},
    opts = {
        enabled = true,
        cloak_character = "*",
        highlight_group = "Comment",
        patterns = {
            {
                file_pattern = ".env*",
                cloak_pattern = "=.+",
            },
        },
    },
}
