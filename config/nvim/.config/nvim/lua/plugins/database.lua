return {
    {
        "kristijanhusak/vim-dadbod-ui",
        ft = { 'sql', 'plsql', 'mysql' },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        keys = {
            {
                "<leader>db",
                function()
                    for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
                        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
                            local buf = vim.api.nvim_win_get_buf(win)
                            if vim.bo[buf].filetype == "dbui" then
                                vim.api.nvim_set_current_tabpage(tab)
                                vim.api.nvim_set_current_win(win)
                                return
                            end
                        end
                    end
                    -- not found anywhere, open a fresh tab
                    vim.cmd("tabnew | DBUI")
                end,
                desc = "Dadbod: Open UI",
            },
        },
        dependencies = {
            "tpope/vim-dadbod",
            "kristijanhusak/vim-dadbod-completion",
        },
    },
}
