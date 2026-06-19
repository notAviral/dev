-- Options / Settings for Neovim
local opt = vim.opt

-- Tab opts
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")

-- Leader Key
vim.g.mapleader = " "

-- timeout Length for mapped sequence completion
opt.timeoutlen = 250

-- Visuals
vim.wo.number = true
vim.wo.relativenumber = true
opt.scrolloff = math.floor(vim.o.lines / 2) - 3

-- splits
opt.splitbelow = true
opt.splitright = true

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true

-- Conceal level
opt.conceallevel = 2
opt.concealcursor = "nc"

-- Wrapping behavior
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "↪ "
-- opt.textwidth = 80 -- this is for formatters not visual guide
-- opt.colorcolumn = "80"

-- Move by visual lines when wrapped
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
