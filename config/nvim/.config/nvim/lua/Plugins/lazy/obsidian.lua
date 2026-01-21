-- File: lua/plugins/lazy/obsidian.lua
return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = false, -- Load immediately
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("Plugins.config.obsidian")
    end,
}
