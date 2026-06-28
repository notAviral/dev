local M = {}

function M.setup()
	require("lazy").setup({
		root = vim.fn.stdpath("data") .. "/lazy",
		lockfile = vim.fn.stdpath("config") .. "lazylock.json",
		spec = {
			{ import = "plugins" },
		},
		change_detection = { notify = false },
		rocks = {
			hererocks = true,
		},
		defaults = {
			lazy = false,
			version = nil,
			cond = nil,
		},
		git = {
			log = { "-1" },
			timeout = 120,
			cooldown = 0,
		},
		dev = {
			path = "~/Development/Projects",
			fallback = true,
		},
		ui = {
			size = { width = 1, height = 1 },
			wrap = true,
			border = "none",
			backdrop = 80,
			title = "Neovim Plugin Manager",
			title_pos = "center",
			icons = {
				cmd = " ",
				config = "",
				debug = "● ",
				event = " ",
				favorite = " ",
				ft = " ",
				init = " ",
				import = " ",
				keys = " ",
				lazy = "󰒲 ",
				loaded = "●",
				not_loaded = "○",
				plugin = " ",
				runtime = " ",
				require = "󰢱 ",
				source = " ",
				start = " ",
				task = "✔ ",
				list = {
					"●",
					"➜",
					"★",
					"‒",
				},
			},
		},
	})
end

function M.boot()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_echo({
				{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
				{ out, "WarningMsg" },
				{ "\nPress any key to exit..." },
			}, true, {})
			vim.fn.getchar()
			os.exit(1)
		end
	end
	vim.opt.rtp:prepend(lazypath)
end

return M
