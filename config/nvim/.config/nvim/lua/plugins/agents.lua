return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        lazy = true,
        cmd = { "CopilotChat" },
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master", name = "Plenary" },
            { "github/copilot.vim",    name = "Copilot" },
        },
        build = "make tiktoken",
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
