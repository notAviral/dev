local dap_loaded = false

local function debug_start()
    if dap_loaded then
        vim.notify("Debugger already started", vim.log.levels.INFO)
        return
    end

    -- Force-load the dormant plugins
    require("lazy").load({
        plugins = {
            "nvim-dap",
            "nvim-dap-ui",
            "nvim-dap-virtual-text",
            "mason-nvim-dap.nvim",
            "nvim-dap-go",
        }
    })

    -- Setup everything now that it's on runtimepath
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()
    require("nvim-dap-virtual-text").setup()
    require("mason-nvim-dap").setup({
        ensure_installed = { "delve" },
        automatic_installation = true,
    })
    require("dap-go").setup()

    -- Auto open/close dapui on session events
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end

    -- Load keymaps only now
    require("keymaps.core.debugMaps")

    dap_loaded = true
    vim.notify("Debugger loaded — ready to set breakpoints (<leader>B) and run (<F5>)", vim.log.levels.INFO)
end

local function debug_stop()
    if not dap_loaded then
        vim.notify("Debugger was never started", vim.log.levels.WARN)
        return
    end

    local dap = require("dap")
    local dapui = require("dapui")

    -- terminate any active session
    dap.terminate()
    dapui.close()

    vim.notify("Debug session stopped and UI closed", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("DebugStart", debug_start, {
    desc = "Lazily load and initialize the debugging setup",
})

vim.api.nvim_create_user_command("DebugStop", debug_stop, {
    desc = "Terminate active debug session and close dapui",
})
