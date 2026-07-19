return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        lazy = true,
        cmd = { "CopilotChat" },
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
            { "github/copilot.vim" },
        },
        build = "make tiktoken",
        keys = {
            -- Copilot Chat
            {
                "<leader>cc",
                "<cmd>CopilotChat<CR>",
                desc = "Copilot: Chat with Copilot",
            },
            {
                "<leader>ce",
                "<cmd>CopilotChatExplain<CR>",
                mode = "v",
                desc = "Copilot: Explain Code",
            },
            {
                "<leader>cr",
                "<cmd>CopilotChatReview<CR>",
                mode = "v",
                desc = "Copilot: Review Code",
            },
            {
                "<leader>cf",
                "<cmd>CopilotChatFix<CR>",
                mode = "v",
                desc = "Copilot: Code Fixes",
            },
            {
                "<leader>cd",
                "<cmd>CopilotChatDocs<CR>",
                mode = "v",
                desc = "Copilot: Generate Documentation",
            },
            {
                "<leader>cT",
                "<cmd>CopilotChatTests<CR>",
                mode = "v",
                desc = "Copilot: Generate Tests",
            },
            {
                "<leader>cm",
                "<cmd>CopilotChatCommit<CR>",
                desc = "Copilot: Generate Commit Message",
            },
            {
                "<leader>ct",
                function()
                    if vim.g.copilot_enabled then
                        vim.cmd("Copilot disable")
                        vim.g.copilot_enabled = false
                        vim.notify("Copilot disabled")
                    else
                        vim.cmd("Copilot enable")
                        vim.g.copilot_enabled = true
                        vim.notify("Copilot enabled")
                    end
                end,
                desc = "Copilot: Toggle",
            },
        },
        opts = {
            model = "claude-haiku-4.5",
            temperature = 0.1,
            trusted_tools = nil,
            auto_insert_mode = true,

            window = {
                layout = "float",
                width = 80,
                height = 20,
                border = "rounded",
                title = "🤖 AI Assistant",
                zindex = 100,
            },

            headers = {
                user = "👤 You",
                assistant = "🤖 Copilot",
                tool = "🔧 Tool",
            },

            separator = "━━",
            auto_fold = true, -- Automatically folds non-assistant messages
        },
    },
}
