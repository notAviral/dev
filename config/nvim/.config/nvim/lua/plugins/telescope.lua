return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        lazy = true,
        dependencies = {
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        keys = {
            -- Main Navigation
            {
                "<leader>f",
                function()
                    require("telescope.builtin").find_files()
                end,
                desc = "Telescope: Find Files",
            },
            {
                "<leader>gf",
                function()
                    require("telescope.builtin").git_files()
                end,
                desc = "Telescope: Git Files",
            },
            {
                "<leader>gg",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "Telescope: Live Grep",
            },
            {
                "<leader>b",
                function()
                    require("telescope.builtin").buffers()
                end,
                desc = "Telescope: Buffers",
            },

            -- Grep
            {
                "<leader>tw",
                function()
                    require("telescope.builtin").grep_string({
                        search = vim.fn.expand("<cword>"),
                    })
                end,
                desc = "Telescope: Grep Word Under Cursor",
            },
            {
                "<leader>tW",
                function()
                    require("telescope.builtin").grep_string({
                        search = vim.fn.expand("<cWORD>"),
                    })
                end,
                desc = "Telescope: Grep WORD Under Cursor",
            },
            {
                "<leader>ten",
                function()
                    require("telescope.builtin").find_files({
                        cwd = vim.fn.stdpath("config"),
                    })
                end,
                desc = "Telescope: Neovim Config",
            },

            -- Navigation
            {
                "<leader>rr",
                function()
                    require("telescope.builtin").oldfiles()
                end,
                desc = "Telescope: Recent Files",
            },
            {
                "<leader>tj",
                function()
                    require("telescope.builtin").jumplist()
                end,
                desc = "Telescope: Jump List",
            },

            -- Help
            {
                "<leader>th",
                function()
                    require("telescope.builtin").builtin()
                end,
                desc = "Telescope: Builtin Pickers",
            },
            {
                "<leader>sh",
                function()
                    require("telescope.builtin").help_tags()
                end,
                desc = "Telescope: Help Tags",
            },
            {
                "<leader>sk",
                function()
                    require("telescope.builtin").keymaps()
                end,
                desc = "Telescope: Keymaps",
            },
            {
                "<leader>vc",
                function()
                    require("telescope.builtin").commands()
                end,
                desc = "Telescope: Commands",
            },
            {
                "<leader>vo",
                function()
                    require("telescope.builtin").vim_options()
                end,
                desc = "Telescope: Vim Options",
            },
        },
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                prompt_prefix = " > ",
                selection_caret = " ▸ ",
                file_ignore_patterns = {
                    "node_modules",
                    "dist",
                    "build",
                    "%.git/",
                },
                dynamic_preview_title = true,
                mappings = {
                    i = {
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    hidden = true,
                },
                commands = {
                    layout_strategy = "center",
                    layout_config = {
                        center = { width = 0.7 },
                    },
                },
                help_tags = {
                    layout_strategy = "center",
                },
                vim_options = {
                    layout_strategy = "center",
                },
                keymaps = {
                    layout_strategy = "center",
                    layout_config = {
                        center = { width = 0.7 },
                    },
                },
                builtin = {
                    layout_strategy = "center",
                },
            },
        },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<leader>ha",
                function()
                    require("harpoon"):list():add()
                end,
                desc = "Harpoon: Add to List",
            },
            {
                "<C-h>",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Harpoon: Toggle Menu",
            },
            {
                "<C-1>",
                function()
                    require("harpoon"):list():select(1)
                end,
                desc = "Harpoon: Select 1",
            },
            {
                "<C-2>",
                function()
                    require("harpoon"):list():select(2)
                end,
                desc = "Harpoon: Select 2",
            },
            {
                "<C-3>",
                function()
                    require("harpoon"):list():select(3)
                end,
                desc = "Harpoon: Select 3",
            },
            {
                "<C-4>",
                function()
                    require("harpoon"):list():select(4)
                end,
                desc = "Harpoon: Select 4",
            },
            {
                "<C-5>",
                function()
                    require("harpoon"):list():select(5)
                end,
                desc = "Harpoon: Select 5",
            },
            {
                "<leader>h1",
                function()
                    require("harpoon"):list():select(1)
                end,
                desc = "Harpoon: Select 1",
            },
            {
                "<leader>h2",
                function()
                    require("harpoon"):list():select(2)
                end,
                desc = "Harpoon: Select 2",
            },
            {
                "<leader>h3",
                function()
                    require("harpoon"):list():select(3)
                end,
                desc = "Harpoon: Select 3",
            },
            {
                "<leader>h4",
                function()
                    require("harpoon"):list():select(4)
                end,
                desc = "Harpoon: Select 4",
            },
            {
                "<leader>h5",
                function()
                    require("harpoon"):list():select(5)
                end,
                desc = "Harpoon: Select 5",
            },
            {
                "<leader>hj",
                function()
                    require("harpoon"):list():prev()
                end,
                desc = "Harpoon: Previous",
            },
            {
                "<leader>hk",
                function()
                    require("harpoon"):list():next()
                end,
                desc = "Harpoon: Next",
            },
        },
        opts = {},
    }
}
