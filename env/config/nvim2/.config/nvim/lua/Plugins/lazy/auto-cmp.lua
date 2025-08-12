return {
  -- Core completion engine
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Snippet engine
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip", -- Snippet completion source

    -- Completion sources
    "hrsh7th/cmp-nvim-lsp", -- LSP source
    "hrsh7th/cmp-buffer",   -- Buffer words source
    "hrsh7th/cmp-path",     -- File path source

    -- Visuals
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("Plugins.config.completions").setup()
    -- You should also have your LSP servers set up and passing completion data
    -- (e.g., via `lspconfig`)
  end,
}
