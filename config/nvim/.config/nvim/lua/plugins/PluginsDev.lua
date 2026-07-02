local M = {}
local root = vim.fn.expand("~/Development/Projects/plugins")

---comment
---@param plugin string : name in local plugins dir
---@param opts table : options to be passed to plugin
---@diagnostic disable: unused-function
---@diagnostic disable: unused-local
---/commnet
local plug = function(plugin, opts)
    table.insert(M, {
        dir = vim.fn.expand(root .. plugin),
        lazy = false,
        opts = opts or {},
    })
end

--- Use Plugin Imports here
--- use: plug "<name>"
--- one in each line


--- Add folke/Lazydev.nvim plugin for better plugin development experience

local is_plugin_dev = function()
    local cwd = vim.uv.cwd()
    if not cwd then
        return false
    end
    return cwd:match("^" .. vim.pesc(vim.fn.expand("~/Development/Projects/plugins")))
end

local lazydev = {
    "folke/lazydev.nvim",
    cond = is_plugin_dev(),
    ft = "lua",
    opts = {
        library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    },
    specs = {
        {
            "Saghen/blink.cmp",
            optional = true,
            opts = {
                sources = {
                    default = { "lazydev", "lsp", "snippets", "buffer", "path" },
                    providers = {
                        lazydev = {
                            name = "lazydev",
                            module = "lazydev.integrations.blink",
                            score_offset = 100,
                        },
                    },
                },
            },
        },
    },
}
table.insert(M, lazydev)

--- return the module as lazy supported table
return M
