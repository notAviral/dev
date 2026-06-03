return {
    "fnune/recall.nvim",
    config = function ()
        require("recall").setup({
            sign = "",
            sign_highlight = "@comment.note",

            wshada = vim.fn.has("nvim-0.10") == 0,
        })
    end
}
