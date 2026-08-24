local mode = vim.env.NVIM_MODE

if mode == "email" then
    vim.opt_local.textwidth = 72
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true

    -- Spellcheck on, since you're writing prose not code
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"

    -- Auto-format paragraphs as you type (respects textwidth)
    vim.opt_local.formatoptions:append("aw")

    -- No line numbers, distraction-free-ish
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false

    -- Start in insert mode at the top of the body (skip past quoted headers)
    vim.cmd("normal! gg")

    -- Jump past quoted reply text to where you actually start typing
    -- (assumes your signature/quote starts with "-- " or "On ... wrote:")
    local ok = pcall(vim.cmd, [[/^$/]])
    if ok then
        vim.cmd("normal! j")
    end
end
