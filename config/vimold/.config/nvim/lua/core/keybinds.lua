-- Generic KeyBinds :
local set = vim.keymap.set

-- Copy Pasta KeyBinds :
set({ "n", "v" }, "Y", '"+y', { desc = "Copy to clipboard" })
set({ "n", "v" }, "P", '"+p', { desc = "Paste from clipboard" })
set({ "n", "v" }, "<C-c>", '"+y', { desc = "Copy to clipboard --Control C" })
set({ "n", "v" }, "<C-p", '"+p', { desc = "Paste from clipboard --Control P" })

-- QoL KeyBinds
set("n", "<leader><leader>r", ":source % <CR>") -- source the entire file
set("n", "K", function()
	vim.lsp.buf.hover()
end, {})

set("v", "J", ":m '>+1<CR>gv=gv", {})
set("v", "K", ":m '<-2<CR>gv=gv", {})

-- Buffers / Quickfix list motion:
local function quickfix_open()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].buftype == "quickfix" then
			return true
		end
	end
	return false
end
set("n", "<C-k>", function()
	if quickfix_open() > 0 then
		vim.cmd("cprev")
	else
		vim.cmd("bprev")
	end
end, { desc = "Buffer / Quickfix Prev" })
set("n", "<C-j>", function()
	if quickfix_open() > 0 then
		vim.cmd("cnext")
	else
		vim.cmd("bnext")
	end
end, { desc = "Buffer / Quickfix Next" })

-- Splits
set("n", "<leader>vv", require("customKeybinds.splits").verticalSplit, { desc = "vertically split the window" })
set("n", "<leader>hh", require("customKeybinds.splits").horizontalSplit, { desc = "vertically split the window" })
set("n", "<leader>vs", ":vsplit<CR>", { desc = "Normal verticalSplit" })
set("n", "<leader>hs", ":hsplit<CR>", { desc = "Normal horizontalSplit" })

-- Escape from insert
set("i", "jf", "<ESC>", { desc = "Escape from insert mode" })
set("i", "fj", "<ESC>", { desc = "Escape from insert mode" })

set("i", "<C-l>", "<ESC>", { desc = "Escape from insert mode" })
