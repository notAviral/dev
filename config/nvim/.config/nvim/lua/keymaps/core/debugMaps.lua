---@Note This file is intentionally NOT required from keymaps/init.lua.
-- It only gets required from inside the DebugStart command.

local dap = require("dap")
local dapui = require("dapui")

local map = vim.keymap.set
map("n", "<F5>", dap.continue, { desc = "Debug: Continue" })
map("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
map("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
map("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
map("n", "<leader>B", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
map("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
-- etc.
