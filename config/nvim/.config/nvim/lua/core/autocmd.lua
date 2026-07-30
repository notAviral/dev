vim.api.nvim_create_autocmd('FileType', {
    pattern = 'help',
    callback = function()
        vim.cmd [[wincmd L]]
    end
})
