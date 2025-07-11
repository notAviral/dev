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
require("vim-opt")
require("lazy").setup("plugins")
-- Keymaps:
vim.keymap.set({'n', 'v'}, 'Y', '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({'n', 'v'}, 'P', '"+p', { desc = "Paste from clipboard" })
vim.keymap.set({'n', 'v'}, '<C-c>', '"+y', { desc = "Copy to clipboard --Control C" })
vim.keymap.set({'n', 'v'}, '<C-p', '"+p', { desc = "Paste from clipboard --Control P" })
vim.keymap.set('n', '<BSlash>', ':Neotree<CR>')
