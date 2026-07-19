local M = {}

local defaults = {
    header = [[
    █▄▀█▄   ▄▄▄▄  ▄▀▀▄  █▄▄  ▄▄█ ▄▄▄ █▄▀█▄ ▄█▄
    ▓█  █▄ ▄█ ▀▀ ▄█  █▄  ██  ██   ▀█ ▓█  █▄▌ █▄
    ██  ██ ██    ██  ██  ██  ██  ▄█▄ ██  ██  ██
    ██  ██ ▓▓▄▄  ██  ██  ██  ▒▒   ██ ██  ██  ██
    ▓▓  ▓▓ ▓▓    ▓▓  ▓▓  ▓▓  ▓▓   ▓▓ ▓▓  ▓▓  ▓▓
    ██  ██ ▀█    ▀█  █▀  ▀▀▌ ▀▀  ▄██ ██  ▀█  ██
    ▀▀  ██  ▀▀▀   ▀▄▄▀    ▀█▄▀    ▀▀ ▀▀      █▀]],
    footer = nil,
    position = {
        vertical = 0.2,
    },
    keymaps = {
        { key = "f", desc = "Find file",    action = ":Telescope find_files<CR>" },
        { key = "r", desc = "Recent files", action = ":Telescope oldfiles<CR>" },
        { key = "n", desc = "New file",     action = ":enew<CR>" },
        { key = "q", desc = "Quit",         action = ":q<CR>" },
        { key = "L", desc = "Leetcode",     action = ":Leet<CR>" },
    },
    menu_key_hl = { fg = "#e0af68", bold = true }, -- the "[ f ]" part only
}

local opts = defaults
local ns = vim.api.nvim_create_namespace("dashboard")

local function split_block(text)
    if not text then return {} end
    local lines = vim.split(text, "\n", { plain = true })
    while #lines > 0 and lines[1]:match("^%s*$") do table.remove(lines, 1) end
    while #lines > 0 and lines[#lines]:match("^%s*$") do table.remove(lines, #lines) end
    local min_indent = nil
    for _, line in ipairs(lines) do
        if line:match("%S") then
            local indent = #(line:match("^%s*"))
            if not min_indent or indent < min_indent then min_indent = indent end
        end
    end
    if min_indent and min_indent > 0 then
        for i, line in ipairs(lines) do
            lines[i] = line:sub(min_indent + 1)
        end
    end
    return lines
end

local function center_block(lines, win_width)
    if #lines == 0 then return {} end
    local block_width = 0
    for _, line in ipairs(lines) do
        local w = vim.fn.strdisplaywidth(line)
        if w > block_width then block_width = w end
    end
    local left_pad = math.max(0, math.floor((win_width - block_width) / 2))
    local pad_str = string.rep(" ", left_pad)
    local out = {}
    for _, line in ipairs(lines) do
        out[#out + 1] = pad_str .. line
    end
    return out
end

local function define_hl(name, spec)
    if type(spec) == "string" then
        vim.api.nvim_set_hl(0, name, { link = spec })
    elseif type(spec) == "table" then
        vim.api.nvim_set_hl(0, name, spec)
    end
end

local function apply_highlights()
    define_hl("DashboardMenuKey", opts.menu_key_hl)
end

function M.open()
    if vim.fn.argc() ~= 0 then return end

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_current_buf(buf)
    local win = vim.api.nvim_get_current_win()

    local win_width = vim.api.nvim_win_get_width(win)
    local win_height = vim.api.nvim_win_get_height(win)

    local header_lines = split_block(opts.header)
    local footer_lines = split_block(opts.footer)

    local menu_lines = {}
    for _, km in ipairs(opts.keymaps) do
        menu_lines[#menu_lines + 1] = string.format("[ %s ] %s", km.key, km.desc)
    end

    header_lines = center_block(header_lines, win_width)
    menu_lines = center_block(menu_lines, win_width)
    footer_lines = center_block(footer_lines, win_width)

    local lines = {}
    vim.list_extend(lines, header_lines)
    if #header_lines > 0 and #menu_lines > 0 then
        table.insert(lines, ""); table.insert(lines, "")
    end
    local menu_range
    if #menu_lines > 0 then
        local start_row = #lines
        vim.list_extend(lines, menu_lines)
        menu_range = { start = start_row, stop = #lines }
    end
    if #footer_lines > 0 then
        table.insert(lines, ""); table.insert(lines, "")
        vim.list_extend(lines, footer_lines)
    end

    vim.bo[buf].modifiable = true
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].swapfile = false

    local win_opts = { number = false, relativenumber = false, cursorline = false, wrap = false }
    for name, val in pairs(win_opts) do
        vim.api.nvim_set_option_value(name, val, { win = win, scope = "local" })
    end

    local height_factor = (opts.position and opts.position.vertical) or 0.4
    local top_pad = math.max(0, math.floor(win_height * height_factor))
    for _ = 1, top_pad do
        vim.api.nvim_buf_set_lines(buf, 0, 0, false, { "" })
    end
    if menu_range then
        menu_range.start = menu_range.start + top_pad
        menu_range.stop = menu_range.stop + top_pad
    end
    vim.bo[buf].modifiable = false

    apply_highlights()
    vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)

    -- highlight only the "[ x ]" key part of each menu line
    if menu_range then
        for row = menu_range.start, menu_range.stop - 1 do
            local line = vim.api.nvim_buf_get_lines(buf, row, row + 1, false)[1]
            local key_end = line:find("%]")
            if key_end then
                vim.api.nvim_buf_set_extmark(buf, ns, row, 0, {
                    end_row = row,
                    end_col = key_end,
                    hl_group = "DashboardMenuKey",
                })
            end
        end
    end

    local map_opts = { buffer = buf, nowait = true, silent = true }
    for _, km in ipairs(opts.keymaps) do
        vim.keymap.set("n", km.key, km.action, map_opts)
    end
end

vim.api.nvim_create_autocmd("VimEnter", {
    callback = M.open,
})

vim.api.nvim_create_user_command("Dashboard", M.open, {})

return M
