
-- Generic KeyBinds :
local set = vim.keymap.set

-- Copy Pasta KeyBinds :
set({'n', 'v'}, 'Y', '"+y', { desc = "Copy to clipboard" })
set({'n', 'v'}, 'P', '"+p', { desc = "Paste from clipboard" })
set({'n', 'v'}, '<C-c>', '"+y', { desc = "Copy to clipboard --Control C" })
set({'n', 'v'}, '<C-p', '"+p', { desc = "Paste from clipboard --Control P" })

-- QoL KeyBinds
set("n", "<leader><leader>r", ":source %") -- source the entire file

-- Splits 
require("customKeybinds.splits").verticalSplit() -- <leader>vs
require("customKeybinds.splits").horizontalSplit() -- <leader>ss
