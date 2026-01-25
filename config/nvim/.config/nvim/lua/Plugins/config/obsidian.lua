local obsidian = require("obsidian")

obsidian.setup({

    legacy_commands = false,

    workspaces = {
        {
            name = "Notes",
            path = vim.fn.expand("~/Notes"),
        },
    },

    notes_subdir = "Inbox",
    new_notes_location = "notes_subdir",

    templates = {
        folder = "Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
    },

    -- clean, deterministic note names
    note_id_func = function(title)
        if title and title ~= "" then
            return title
        end

        return os.date("%Y%m%d-%H%M%S")
    end,

    frontmatter = {
        enabled = false,
        func = require("obsidian.builtin").frontmatter,
        sort = { "id", "aliases", "tags" },
    }

    preferred_link_style = "markdown",

    completion = {
        nvim_cmp = false,
        blink = true,
        min_chars = 2,
    },

    checkboxes = {
        order = { " ", "x", ">", "~" },
    },

    ui = {
        enable = false,

        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = "ObsidianRefText" },
        highlight_text = { hl_group = "ObsidianHighlightText" },
        tags = { hl_group = "ObsidianTag" },
    },

    picker = {
        name = "telescope.nvim",
        mappings = {
            new = "<C-x>",
            insert_link = "<C-l>",
        },
    },
})
