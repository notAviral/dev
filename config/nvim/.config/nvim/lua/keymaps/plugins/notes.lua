-- General
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Obsidian: New note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Obsidian: Quick switch" })
vim.keymap.set("n", "<leader>og", "<cmd>ObsidianSearch<CR>", { desc = "Obsidian: Search notes" })
vim.keymap.set("n", "<leader>od", "<cmd>ObsidianToday<CR>", { desc = "Obsidian: Today's note" })
vim.keymap.set("n", "<leader>oy", "<cmd>ObsidianYesterday<CR>", { desc = "Obsidian: Yesterday's note" })
vim.keymap.set("n", "<leader>om", "<cmd>ObsidianTomorrow<CR>", { desc = "Obsidian: Tomorrow's note" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(event)
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = event.buf,
                desc = desc,
            })
        end

        -- Navigation
        map("n", "<leader>of", "<cmd>ObsidianFollowLink<CR>", "Obsidian: Follow link")
        map("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", "Obsidian: Backlinks")
        map("n", "<leader>oT", "<cmd>ObsidianTags<CR>", "Obsidian: Tags")
        map("n", "<leader>oi", "<cmd>ObsidianLinks<CR>", "Obsidian: Links in note")
        map("n", "<leader>oc", "<cmd>ObsidianTOC<CR>", "Obsidian: Table of contents")

        -- Notes
        map("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", "Obsidian: Insert template")
        map("n", "<leader>oN", "<cmd>ObsidianNewFromTemplate<CR>", "Obsidian: New from template")
        map("n", "<leader>or", "<cmd>ObsidianRename<CR>", "Obsidian: Rename note")
        map("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", "Obsidian: Open in Obsidian")

        -- Linking
        map({ "n", "v" }, "<leader>ol", "<cmd>ObsidianLink<CR>", "Obsidian: Link selection")
        map("v", "<leader>oL", "<cmd>ObsidianLinkNew<CR>", "Obsidian: Create linked note")
        map("v", "<leader>oe", "<cmd>ObsidianExtractNote<CR>", "Obsidian: Extract note")

        -- Checkboxes
        map("n", "<leader>ox", "<cmd>ObsidianToggleCheckbox<CR>", "Obsidian: Toggle checkbox")
    end,
})
