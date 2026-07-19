return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        enabled = true,
        ft = "markdown",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
        opts = {
            render_modes = { "n", "c", "t" },
            completions = { blink = { enabled = true } },
            -- HEADINGS
            heading = {
                enabled = true,
                position = "inline",
                width = "full",
                -- padding = 0,
                backgrounds = {},
                icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
            },
            -- CODE BLOCKS
            code = {
                enabled = true,
                style = "full",
                width = "full",
                language = true,
                border = "hide",
                -- padding = 1,
                -- wrapper only (syntax still treesitter)
                highlight = "RenderMarkdownCode",
                highlight_inline = "RenderMarkdownCode",
            },
            latex = {
                enabled = true,
                highlight = "RenderMarkdownMath",
                position = "center",
                top_pad = 0,
                bottom_pad = 0,
            },
        },
    },
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        dependencies = {
            { "nvim-lua/plenary.nvim", },
            { "nvim-telescope/telescope.nvim", },
            { "nvim-treesitter/nvim-treesitter", },
        },
        keys = {
            -- Global mappings
            { "<leader>on", "<cmd>Obsidian new<CR>",          desc = "Obsidian: New Note" },
            { "<leader>os", "<cmd>Obsidian quick_switch<CR>", desc = "Obsidian: Quick Switch" },
            { "<leader>og", "<cmd>Obsidian search<CR>",       desc = "Obsidian: Search Notes" },
            { "<leader>od", "<cmd>Obsidian today<CR>",        desc = "Obsidian: Today's Note" },
            { "<leader>oy", "<cmd>Obsidian yesterday<CR>",    desc = "Obsidian: Yesterday's Note" },
            { "<leader>om", "<cmd>Obsidian tomorrow<CR>",     desc = "Obsidian: Tomorrow's Note" },

            -- Markdown-only mappings
            {
                "<leader>of",
                "<cmd>Obsidian follow_link<CR>",
                ft = "markdown",
                desc = "Obsidian: Follow Link",
            },
            {
                "<leader>ob",
                "<cmd>Obsidian backlinks<CR>",
                ft = "markdown",
                desc = "Obsidian: Backlinks",
            },
            {
                "<leader>oT",
                "<cmd>Obsidian tags<CR>",
                ft = "markdown",
                desc = "Obsidian: Tags",
            },
            {
                "<leader>oi",
                "<cmd>Obsidian links<CR>",
                ft = "markdown",
                desc = "Obsidian: Links",
            },
            {
                "<leader>oc",
                "<cmd>Obsidian toc<CR>",
                ft = "markdown",
                desc = "Obsidian: Table of Contents",
            },

            {
                "<leader>ot",
                "<cmd>Obsidian template<CR>",
                ft = "markdown",
                desc = "Obsidian: Insert Template",
            },
            {
                "<leader>oN",
                "<cmd>Obsidian new_from_template<CR>",
                ft = "markdown",
                desc = "Obsidian: New From Template",
            },
            {
                "<leader>or",
                "<cmd>Obsidian rename<CR>",
                ft = "markdown",
                desc = "Obsidian: Rename Note",
            },
            {
                "<leader>oo",
                "<cmd>Obsidian open<CR>",
                ft = "markdown",
                desc = "Obsidian: Open in Obsidian",
            },

            {
                "<leader>ol",
                "<cmd>Obsidian link<CR>",
                mode = { "n", "v" },
                ft = "markdown",
                desc = "Obsidian: Link Selection",
            },
            {
                "<leader>oL",
                "<cmd>Obsidian link_new<CR>",
                mode = "v",
                ft = "markdown",
                desc = "Obsidian: Create Linked Note",
            },
            {
                "<leader>oe",
                "<cmd>Obsidian extract_note<CR>",
                mode = "v",
                ft = "markdown",
                desc = "Obsidian: Extract Note",
            },

            {
                "<leader>ox",
                "<cmd>Obsidian toggle_checkbox<CR>",
                ft = "markdown",
                desc = "Obsidian: Toggle Checkbox",
            },
        },
        opts = {
            legacy_commands = false,
            workspaces = {
                {
                    name = "Notes",
                    path = vim.fn.expand("~/Knowledge/Notes"),
                },
            },

            notes_subdir = "Inbox",
            new_notes_location = "notes_subdir",

            note_id_func = function(title)
                if title and title ~= "" then
                    return title
                end
                return os.date("%Y%m%d-%H%M%S")
            end,

            frontmatter = {
                enabled = false,
            },

            link = {
                style = "markdown",
            },

            checkbox = {
                order = { " ", "x", ">", "~" },
            },

            templates = {
                folder = "Templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
            },

            daily_notes = {
                folder = "Daily",
                date_format = "%Y-%m-%d",
            },

            search = {
                sort_by = "modified",
                sort_reversed = true,
                max_lines = 1000,
            },

            ui = {
                enable = true,

                external_link_icon = {
                    char = "",
                    hl_group = "ObsidianExtLinkIcon",
                },

                reference_text = {
                    hl_group = "ObsidianRefText",
                },

                highlight_text = {
                    hl_group = "ObsidianHighlightText",
                },

                tags = {
                    hl_group = "ObsidianTag",
                },

                checkboxes = {
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                },
            },

            attachments = {
                folder = "Assets/Images",
            },

            open_notes_in = "current",
        },
    },
    {
        "lukas-reineke/headlines.nvim",
        ft = "org",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            markdown = { query = false },
        },
    },
    {

        "Thiago4532/mdmath.nvim",
        lazy = true,
        ft = { "markdown", "tex" },
        opts = {
            filetypes = { "markdown", "tex" },
            foreground = "Normal",
            anticonceal = true,
            hide_on_insert = true,
            dynamic = true,
            dynamic_scale = 0.7,
            update_interval = 400,
            internal_scale = 1.0,
        }
    },
}
