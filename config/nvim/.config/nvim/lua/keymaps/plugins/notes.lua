-- General
vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<CR>", { desc = "Obsidian: New note" })
vim.keymap.set("n", "<leader>os", "<cmd>Obsidian quick_switch<CR>", { desc = "Obsidian: Quick switch" })
vim.keymap.set("n", "<leader>og", "<cmd>Obsidian search<CR>", { desc = "Obsidian: Search notes" })
vim.keymap.set("n", "<leader>od", "<cmd>Obsidian today<CR>", { desc = "Obsidian: Today's note" })
vim.keymap.set("n", "<leader>oy", "<cmd>Obsidian yesterday<CR>", { desc = "Obsidian: Yesterday's note" })
vim.keymap.set("n", "<leader>om", "<cmd>Obsidian tomorrow<CR>", { desc = "Obsidian: Tomorrow's note" })

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
        map("n", "<leader>of", "<cmd>Obsidian follow_link<CR>", "Obsidian: Follow link")
        map("n", "<leader>ob", "<cmd>Obsidian backlinks<CR>", "Obsidian: Backlinks")
        map("n", "<leader>oT", "<cmd>Obsidian tags<CR>", "Obsidian: Tags")
        map("n", "<leader>oi", "<cmd>Obsidian links<CR>", "Obsidian: Links in note")
        map("n", "<leader>oc", "<cmd>Obsidian toc<CR>", "Obsidian: Table of contents")
        -- Notes
        map("n", "<leader>ot", "<cmd>Obsidian template<CR>", "Obsidian: Insert template")
        map("n", "<leader>oN", "<cmd>Obsidian new_from_template<CR>", "Obsidian: New from template")
        map("n", "<leader>or", "<cmd>Obsidian rename<CR>", "Obsidian: Rename note")
        map("n", "<leader>oo", "<cmd>Obsidian open<CR>", "Obsidian: Open in Obsidian")
        -- Linking
        map({ "n", "v" }, "<leader>ol", "<cmd>Obsidian link<CR>", "Obsidian: Link selection")
        map("v", "<leader>oL", "<cmd>Obsidian link_new<CR>", "Obsidian: Create linked note")
        map("v", "<leader>oe", "<cmd>Obsidian extract_note<CR>", "Obsidian: Extract note")
        -- Checkboxes
        map("n", "<leader>ox", "<cmd>Obsidian toggle_checkbox<CR>", "Obsidian: Toggle checkbox")
    end,
})
