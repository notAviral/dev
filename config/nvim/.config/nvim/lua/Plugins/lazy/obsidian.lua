return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    opts = {
        legacy_commands = true,
        workspaces = {
            {
                name = "My Notes",
                path = "~/Education/MyNotes",
            },
        },
    },
}
