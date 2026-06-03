--[[
-- This is my main Neovim config
-- author - Aviral Dubey
--]]

-- Importing the options :
require("core.opts")

-- Installing and Sourcing Lazy Pluggin Manager :
require("core.lazy")

-- Importing keybinds :
require("Plugins.keybinds")
require("core.keybinds")

-- Importing Extra Modules :
require("core.extras")
