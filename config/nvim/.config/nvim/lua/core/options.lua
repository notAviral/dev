--- Options ---

-- Leader Key
vim.g.mapleader = " "

-- Vim Keymaps timeouts
vim.timeoutlen = 400

-- Visual Options
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.scrolloff = math.floor(vim.o.lines / 2)
vim.opt.termguicolors = true

-- Wrapping behavior
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "
vim.opt.textwidth = 80 -- formatters
-- vim.opt.colorcolumn = "80" -- visual

-- Move by visual lines when wrapped
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Best search settings :)
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Conceal level
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

-- Tab opts
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

-- Vim UI 2 
require("vim._core.ui2").enable()
