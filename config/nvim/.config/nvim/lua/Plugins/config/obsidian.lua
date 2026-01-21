local obsidian = require("obsidian")

obsidian.setup({
    workspaces = {
        {
            name = "Notes",
            path = "~/Notes",
        },
    },

    notes_subdir = "Inbox",
    new_notes_location = "notes_subdir",

    templates = {
        folder = "Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
    },

    -- Use simple note naming (just the title with .md extension)
    note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
            -- Clean the title: replace spaces with hyphens, remove special chars
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
            -- If no title, use timestamp
            suffix = tostring(os.date("%Y%m%d-%H%M%S"))
        end
        return suffix -- Just return the cleaned title, no random ID
    end,

    preferred_link_style = "markdown",

    follow_url_func = function(url)
        vim.fn.jobstart({ "xdg-open", url })
    end,

    completion = {
        nvim_cmp = true,
        min_chars = 2,
    },

    mappings = {
        ["gf"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },
        ["<leader>ch"] = {
            action = function()
                return require("obsidian").util.toggle_checkbox()
            end,
            opts = { buffer = true },
        },
    },

    ui = {
        enable = true,
        checkboxes = {
            [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
            ["x"] = { char = "", hl_group = "ObsidianDone" },
            [">"] = { char = "", hl_group = "ObsidianRightArrow" },
            ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        },
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = "ObsidianRefText" },
        highlight_text = { hl_group = "ObsidianHighlightText" },
        tags = { hl_group = "ObsidianTag" },
    },

    -- Enable template picker with Telescope
    picker = {
        name = "telescope.nvim",
        mappings = {
            new = "<C-x>",
            insert_link = "<C-l>",
        },
    },
})
