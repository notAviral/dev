--- ------------------------
--- Neovim Config
--- Author - Aviral Dubey
--- matrix - #aviraldb:matrix.org
--- email - aviraldubey@protonmail.com
--- ------------------------

-- Setting Vim Options
require("core.options")

-- BootStrap Lazy Plugin manager
require("core.lazy").boot()
require("core.lazy").setup()

-- Setting up LSP Support
require("core.lang.lsp")
require("core.lang.mason")

-- Setting up Keymaps
require("keymaps")

-- Setup Debugging
require("core.debugger")
