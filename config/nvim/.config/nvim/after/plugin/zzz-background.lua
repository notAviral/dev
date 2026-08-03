local function set_transparent()
    local groups = {
        -- Core editor
        "Normal", "NormalNC", "NormalFloat", "FloatBorder", "SignColumn",
        "EndOfBuffer", "VertSplit", "WinSeparator", "LineNr", "CursorLineNr",
        "Folded", "NonText", "MsgArea", "MsgSeparator",

        -- Statusline / tabline
        "StatusLine", "StatusLineNC", "TabLine", "TabLineFill", "TabLineSel",
        "WinBar", "WinBarNC",

        -- Popular plugins
        "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal",
        "TelescopePromptBorder", "TelescopeResultsNormal", "TelescopeResultsBorder",
        "TelescopePreviewNormal", "TelescopePreviewBorder",
        "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeWinSeparator", "NvimTreeEndOfBuffer",
        "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeEndOfBuffer",
        "WhichKeyFloat",
        "LazyNormal",
        "MasonNormal",
        "NoiceCmdlinePopup", "NoiceCmdlinePopupBorder",
        "CmpNormal", "CmpBorder", "CmpDocNormal", "CmpDocBorder",
        "BlinkCmpMenu", "BlinkCmpMenuBorder", "BlinkCmpDoc", "BlinkCmpDocBorder",
        "IndentBlanklineChar",
        "NotifyBackground",
    }

    for _, group in ipairs(groups) do
        -- pcall in case a plugin's group doesn't exist yet
        pcall(vim.api.nvim_set_hl, 0, group, { bg = "1d2021" })
    end
end

set_transparent()

-- Re-apply whenever the colorscheme is reloaded (e.g. `:colorscheme x` again)
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_transparent,
})
