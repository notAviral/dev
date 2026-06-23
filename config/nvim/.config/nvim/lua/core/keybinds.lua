-- Generic KeyBinds :
local set = vim.keymap.set

-- Copy Pasta KeyBinds :
set({ "n", "v" }, "Y", '"+y', { desc = "Copy to clipboard" })
set({ "n", "v" }, "P", '"+p', { desc = "Paste from clipboard" })
set({ "n", "v" }, "<C-c>", '"+y', { desc = "Copy to clipboard --Control C" })
set({ "n", "v" }, "<C-p", '"+p', { desc = "Paste from clipboard --Control P" })

-- QoL KeyBinds
set("n", "<leader><leader>r", ":source % <CR>") -- source the entire file

-- Buffers motion:
set("n", "<C-j>", ":bnext<CR>", { desc = "Next buffer" })
set("n", "<C-k>", ":bprevious<CR>", { desc = "Previous buffer" })
set("n", "<C-h>", function()
  if #vim.fn.getqflist() > 0 then
    vim.cmd("cprev")
  else
    vim.cmd("wincmd h")
  end
end, { desc = "Previous in Quickfix" })
set("n", "<C-l>", function()
  if #vim.fn.getqflist() > 0 then
    vim.cmd("cnext")
  else
    vim.cmd("wincmd l")
  end
end, { desc = "Next in Quickfix" })

-- Splits
set("n", "<leader>vv", require("customKeybinds.splits").verticalSplit, { desc = "vertically split the window" })
set("n", "<leader>hh", require("customKeybinds.splits").horizontalSplit, { desc = "vertically split the window" })
set("n", "<leader>vs", ":vsplit<CR>", { desc = "Normal verticalSplit" })
set("n", "<leader>hs", ":hsplit<CR>", { desc = "Normal horizontalSplit" })

-- Escape from insert
set("i", "jf", "<ESC>", { desc = "Escape from insert mode" })
set("i", "fj", "<ESC>", { desc = "Escape from insert mode" })

set("i", "<C-l>", "<ESC>", { desc = "Escape from insert mode" })
