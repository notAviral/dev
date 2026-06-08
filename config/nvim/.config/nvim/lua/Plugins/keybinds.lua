-- Custom variable for vim api
local set = vim.keymap.set

-- NeoTree
set("n", "<BSlash>", "<cmd>Neotree toggle<CR>", { desc = "NeoTree: Open Filetree to left" }) -- spawn a Neotree to the left

-- Oil
set("n", "-", "<cmd>Oil<CR>", { desc = "Oil: Open Parent Directory" })
set({ "n" }, "<leader>e", ":Oil<CR>", { desc = "Oil: Open Explorer as a buffer" })

-- Telescope
local builtin = require("telescope.builtin")
set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: find files" })
set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: live grep" })
set("n", "<leader>tb", builtin.buffers, { desc = "Telescope: buffers" })
set("n", "<leader>b", builtin.buffers, { desc = "Telescope: buffers" })
set("n", "<leader>to", builtin.oldfiles, { desc = "Telescope: Recent Files" })
set("n", "<leader>tc", builtin.commands, { desc = "Telescope: List of Commands" })
set("n", "<leader>sd", builtin.lsp_references, { desc = "Telescope: Definations" })
set("n", "<leader>d", builtin.diagnostics, { desc = "Telescope: Diagnostics" })
set("n", "<leader>th", builtin.builtin, { desc = "Telescope: Builtin Pickers" })
set("n", "<leader>sh", ":Telescope help_tags <CR>", { desc = "Telescope: Show Help Tags" })
set("n", "<leader>sk", ":Telescope keymaps <CR>", { desc = "Telescope: Show Keybinds" })

set("n", "<leader>tm", ":Telescope recall <CR>", { desc = "Telescope & Recall : Show recall marks" })


-- LSP Configs
set("n", "D", vim.lsp.buf.hover, { desc = "LSP: Hover" })
set("n", "sd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })

-- Git
set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns: Preview hunk" })
set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Gitsigns: Toggle blame" })

-- VIM tmux Navigations -
set("n", "<M-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { desc = "Tmux: Navigate Left" })
set("n", "<M-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { desc = "Tmux: Navigate Down" })
set("n", "<M-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { desc = "Tmux: Navigate Up" })
set("n", "<M-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { desc = "Tmux: Navigate Right" })

-- Copilot Chat keybinds-
set("n", "<leader>cc", ":CopilotChat<CR>", { desc = "Copilot: Chat with copilot" })
set("v", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "Copilot: Explain Code" })
set("v", "<leader>cr", ":CopilotChatReview<CR>", { desc = "Copilot: Riview Code" })
set("v", "<leader>cf", ":CopilotChatFix<CR>", { desc = "Copilot: Code Fixes" })
set("v", "<leader>cd", ":CopilotChatDocs<CR>", { desc = "Copilot: Generate Documentation" })
set("v", "<leader>cT", ":CopilotChatTests<CR>", { desc = "Copilot: Generate Tests" })
set("n", "<leader>cm", ":CopilotChatCommit<CR>", { desc = "Copilot: Generate Messages" })
set("n", "<leader>ct", function()
    if vim.g.copilot_enabled then
        vim.cmd("Copilot disable")
        vim.g.copilot_enabled = false
        print("Copilot disabled")
    else
        vim.cmd("Copilot enable")
        vim.g.copilot_enabled = true
        print("Copilot enabled")
    end
end)

-- Obsidian Keybinds
set("n", "<leader>on", "<cmd>Obsidian new<cr>", { desc = "Obsidian: New note (Inbox)" })
set("n", "<leader>os", "<cmd>Obsidian quick_switch<cr>", { desc = "Obsidian: Find notes" })
set("n", "<leader>og", "<cmd>Obsidian search<cr>", { desc = "Obsidian: Grep notes" })
set("n", "<leader>od", "<cmd>Obsidian today<cr>", { desc = "Obsidian: Today's note" })

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.md",
    callback = function()
        -- Navigations
        set("n", "<leader>of", "<cmd>Obsidian follow_link<cr>", { desc = "Obsidian: Follow link" })
        set("n", "<leader>ob", "<cmd>Obsidian backlinks<cr>", { desc = "Obsidian: Backlinks" })
        set("n", "<leader>oT", "<cmd>Obsidian tags<cr>", { desc = "Obsidian: Tags" })

        -- Note Management
        set("n", "<leader>ot", "<cmd>Obsidian template<cr>", { desc = "Obsidian: Insert template" })
        set("n", "<leader>or", "<cmd>Obsidian rename<cr>", { desc = "Obsidian: Rename note" })

        -- Inbox Workflow
        set(
            "n",
            "<leader>ok",
            "<cmd>!mv '%:p' $HOME/Notes/ZettelKasten/<cr> <cmd>bd<cr>",
            { desc = "Obsidian: Keep (move to ZettelKasten)" }
        )
        set("n", "<leader>odd", "<cmd>!rm '%:p'<cr> <cmd>bd<cr>", { desc = "Obsidian: Delete note" })

        -- Linking
        set({ "n", "v" }, "<leader>ol", "<cmd>Obsidian link<cr>", { desc = "Obsidian: Link to note" })
        set("v", "<leader>oL", "<cmd>Obsidian link_new<cr>", { desc = "Obsidian: Create new linked note" })

        -- Utilities
        set("n", "<leader>oo", "<cmd>Obsidian open<cr>", { desc = "Obsidian: Open in app" })
        set("n", "<leader>oc", function()
            return require("obsidian").util.toggle_checkbox()
        end, { desc = "Obsidian: Toggle checkbox" })
    end,
})
