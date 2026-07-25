local packages = require("core.langSpecs").packages

local registry = require("mason-registry")
registry.refresh(function()
    for _, name in ipairs(packages) do
        local pkg = registry.get_package(name)
        if not pkg:is_installed() then
            pkg:install()
        end
    end
end)
