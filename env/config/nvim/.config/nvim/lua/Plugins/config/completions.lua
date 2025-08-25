local M = {}

M.setup = function()
  -- Load nvim-cmp and key components
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  -- Set up nvim-cmp
  cmp.setup({
    -- Completion menu and behavior
    completion = {
      completeopt = "menu,menuone,noselect",
      keyword_length = 1, -- Start completion after 1 character
    },

    -- Sources for completion
    sources = cmp.config.sources({
      { name = "nvim_lsp" },     -- LSP completion
      { name = "luasnip" },      -- Snippet completion
      { name = "buffer" },       -- Words in current buffer
      { name = "path" },         -- File paths
    }),

    -- Formatting and visuals
    formatting = {
      fields = { "abbr", "kind", "menu" },
      format = require("luasnip.integrations.cmp").format,
    },

    -- Mappings
    mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete(),    -- Manually trigger completion
      ["<CR>"] = cmp.mapping.confirm({          -- Confirm selection
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

      -- Navigate snippets and completion menu
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),

    -- UI (Window) configuration
    window = {
      completion = cmp.config.window.bordered({
        -- winhighlight for the completion window
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:PmenuSel",
        -- border = "rounded",
      }),
      documentation = cmp.config.window.bordered({
        -- winhighlight for the documentation window
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:PmenuSel",
        -- border = "rounded",
      }),
    },
  })
end

return M
