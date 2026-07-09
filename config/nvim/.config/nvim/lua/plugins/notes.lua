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
        event = "VeryLazy",
        version = "*",

        dependencies = {
            { "nvim-lua/plenary.nvim", },
            { "nvim-telescope/telescope.nvim", },
            { "nvim-treesitter/nvim-treesitter", },
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
        dependencies = { "nvim-treesitter/nvim-treesitter", name = "Treesitter" },
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
