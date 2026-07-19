-- Import Functions
require("keymaps.functions.buf-qf")
require("keymaps.functions.colorpicker")
require("keymaps.functions.customSplits")


-- Import Core keymaps
require("keymaps.core.qualityOfLife")
require("keymaps.core.lsp")
require("keymaps.core.utils")
require("keymaps.core.terminal")

-- All plugin specific keymaps are handled in lua.plugins
-- within lazy spec with keys field.
-- This is so, because it allows lazy loading these plugins
