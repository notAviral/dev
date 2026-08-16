 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#121317',
    base01 = '#1e1f24',
    base02 = '#292a2e',
    base03 = '#8e909b',
    base04 = '#c5c6d1',
    base05 = '#e3e2e8',
    base06 = '#e3e2e8',
    base07 = '#e3e2e8',
    base08 = '#ffb4ab',
    base09 = '#f4b1ee',
    base0A = '#bec6e4',
    base0B = '#b3c5ff',
    base0C = '#f4b1ee',
    base0D = '#b3c5ff',
    base0E = '#bec6e4',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e3e2e8',          bg = '#121317' })
  hi('TelescopeBorder',         { fg = '#8e909b',             bg = '#121317' })
  hi('TelescopePromptNormal',   { fg = '#e3e2e8',          bg = '#121317' })
  hi('TelescopePromptBorder',   { fg = '#8e909b',             bg = '#121317' })
  hi('TelescopePromptPrefix',   { fg = '#b3c5ff',             bg = '#121317' })
  hi('TelescopePromptCounter',  { fg = '#c5c6d1',  bg = '#121317' })
  hi('TelescopePromptTitle',    { fg = '#121317',             bg = '#b3c5ff' })
  hi('TelescopePreviewTitle',   { fg = '#121317',             bg = '#bec6e4' })
  hi('TelescopeResultsTitle',   { fg = '#121317',             bg = '#f4b1ee' })
  hi('TelescopeSelection',      { fg = '#e3e2e8',          bg = '#292a2e' })
  hi('TelescopeSelectionCaret', { fg = '#b3c5ff',             bg = '#292a2e' })
  hi('TelescopeMatching',       { fg = '#b3c5ff',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
