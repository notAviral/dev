local M = {}

---comment
---@param plugin string : name in local plugins dir
---@param opts table : options to be passed to plugin
---@diagnostic disable: unused-function
---@diagnostic disable: unused-local
---/commnet
local plug = function(plugin, opts)
    table.insert(M, {
        dir = vim.fn.expand("~/Development/Projects/plugins/" .. plugin),
        lazy = false,
        opts = opts or {},
    })
end

--- Use Plugin Imports here
--- use: plug "<name>"
--- one in each line


--- return the module as lazy supported table
return M
