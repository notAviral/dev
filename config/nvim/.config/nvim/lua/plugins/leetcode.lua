return {
    {
        "kawre/leetcode.nvim",
        cmd = "Leet",
        dependencies = {
            { "nvim-telescope/telescope.nvim", },
            { "nvim-lua/plenary.nvim", },
            { "MunifTanjim/nui.nvim", },
        },
        opts = {
            arg = "leetcode",
            lang = "golang",
            cn = { enabled = false },
            storage = {
                home = vim.fn.expand("~/Knowledge/Development/leetcode/"),
                cache = vim.fn.expand("~/.cache/leetcode/"),
            },
            plugins = { non_standalone = false },
            logging = true,
            picker = { provider = "telescope" },
            description = {
                position = "left",
                width = "40%",
            },
            hooks = {
                ["enter"] = {},
                ["question_enter"] = {},
                ["leave"] = {},
            },
            keys = {
                toggle = { "q" },
                confirm = { "<CR>" },
                reset_testcases = "r",
                use_testcase = "U",
                focus_testcases = "F",
                focus_result = "R",
            },
            injector = {
                ["golang"] = {
                    imports = function()
                        return { "package leet" }
                    end,
                },
            },
            theme = {},
            image_support = false,
            editor = {
                fold_imports = false,
            },
        },
    },
}
