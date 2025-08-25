return {
-- Mason-null-ls bridge
{
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        -- Core languages
        "rustfmt",         -- Rust formatter
        "clang_format",    -- C/C++ formatter
        "prettier",        -- JS/TS/JSON/YAML/Markdown formatter
        "eslint_d",        -- JS/TS linter
        "black",           -- Python formatter
        "isort",           -- Python import sorter
        "flake8",          -- Python linter
        -- Additional useful tools
        "stylua",          -- Lua formatter
        "gofmt",           -- Go formatter
        "goimports",       -- Go import formatter
        "shfmt",           -- Shell script formatter
        "shellcheck",      -- Shell script linter
        "markdownlint",    -- Markdown linter
        "yamllint",        -- YAML linter
        "jsonlint",        -- JSON linter
        "cpplint",         -- C++ style checker
      },
      automatic_installation = true,
    })
  end,
}
},

-- None-ls configuration
{
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
      debug = false,
      sources = {
        -- Rust
        formatting.rustfmt.with({
          extra_args = { "--edition", "2021" },
        }),

        -- C/C++
        formatting.clang_format.with({
          extra_args = { "--style=Google" }, -- You can change style: Google, LLVM, Mozilla, Chromium, WebKit
          filetypes = { "c", "cpp", "objc", "objcpp" },
        }),
        diagnostics.cpplint.with({
          args = { "--filter=-whitespace/braces,-whitespace/indent,-build/include_order", "$FILENAME" },
        }),

        -- JavaScript/TypeScript/React
        formatting.prettier.with({
          extra_filetypes = { "svelte", "vue" },
          condition = function(utils)
            return utils.root_has_file({
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.yml",
              ".prettierrc.yaml",
              ".prettierrc.js",
              "prettier.config.js",
              "package.json",
            })
          end,
        }),
        diagnostics.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({
              ".eslintrc.js",
              ".eslintrc.json",
              ".eslintrc.yml",
              ".eslintrc.yaml",
              "eslint.config.js",
              "package.json",
            })
          end,
        }),
        code_actions.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({
              ".eslintrc.js",
              ".eslintrc.json",
              ".eslintrc.yml",
              ".eslintrc.yaml",
              "eslint.config.js",
              "package.json",
            })
          end,
        }),

        -- Python
        formatting.black.with({
          extra_args = { "--fast", "--line-length", "88" },
        }),
        formatting.isort.with({
          extra_args = { "--profile", "black" },
        }),
        diagnostics.flake8.with({
          extra_args = { "--max-line-length=88", "--extend-ignore=E203,W503" },
        }),

        -- Go
        formatting.goimports,
        formatting.gofmt,

        -- Lua
        formatting.stylua.with({
          condition = function(utils)
            return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
          end,
        }),

        -- Shell
        formatting.shfmt.with({
          extra_args = { "-i", "2", "-ci" }, -- 2-space indent, switch case indent
        }),
        diagnostics.shellcheck.with({
          extra_args = { "--severity", "warning" },
        }),

        -- Markdown
        diagnostics.markdownlint.with({
          extra_args = { "--disable", "MD013" }, -- Disable line length rule
        }),

        -- YAML
        diagnostics.yamllint,

        -- JSON
        diagnostics.jsonlint,

        -- General purpose
        diagnostics.codespell.with({
          args = { "--builtin", "clear,rare,code", "-" },
          filetypes = { "markdown", "text", "gitcommit" },
        }),
      },

      -- Format on save with file type specific settings
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          local group = vim.api.nvim_create_augroup("NullLsFormatting", { clear = false })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = group,
            buffer = bufnr,
            callback = function()
              -- Skip formatting for certain file types if needed
              local ft = vim.bo[bufnr].filetype
              if ft == "markdown" then
                -- Skip auto-formatting for markdown to preserve manual formatting
                return
              end
              vim.lsp.buf.format({
                filter = function(c)
                  return c.name == "null-ls"
                end,
                bufnr = bufnr,
                timeout_ms = 3000,
              })
            end,
          })
        end
      end,
    })

    -- Enhanced keymaps
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
        async = true,
        timeout_ms = 3000,
      })
    end, { desc = "Format with null-ls" })

    -- Format selection in visual mode
    vim.keymap.set("v", "<leader>gf", function()
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
        async = false,
        range = {
          ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
          ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
        },
      })
    end, { desc = "Format selection with null-ls" })

    -- Toggle format on save per buffer
    vim.keymap.set("n", "<leader>tf", function()
      local current_buf = vim.api.nvim_get_current_buf()
      
      -- Check if autocmd exists for this buffer
      local autocmds = vim.api.nvim_get_autocmds({
        group = "NullLsFormatting",
        buffer = current_buf,
        event = "BufWritePre",
      })
      
      if #autocmds > 0 then
        vim.api.nvim_clear_autocmds({
          group = "NullLsFormatting",
          buffer = current_buf,
          event = "BufWritePre",
        })
        print("Format on save: OFF (buffer " .. current_buf .. ")")
      else
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("NullLsFormatting", { clear = false }),
          buffer = current_buf,
          callback = function()
            vim.lsp.buf.format({
              filter = function(c)
                return c.name == "null-ls"
              end,
              bufnr = current_buf,
              timeout_ms = 3000,
            })
          end,
        })
        print("Format on save: ON (buffer " .. current_buf .. ")")
      end
    end, { desc = "Toggle format on save" })

    -- Show active formatters/linters for current buffer
    vim.keymap.set("n", "<leader>gl", function()
      local ft = vim.bo.filetype
      local sources = require("null-ls.sources")
      local available_sources = sources.get_available(ft)
      
      print("Available sources for " .. ft .. ":")
      for _, source in ipairs(available_sources) do
        print("  " .. source.name .. " (" .. source.method .. ")")
      end
    end, { desc = "List available null-ls sources" })

    -- Useful commands
    vim.api.nvim_create_user_command("NullLsInfo", function()
      vim.cmd("NullLsInfo")
    end, { desc = "Show null-ls info" })

    vim.api.nvim_create_user_command("NullLsLog", function()
      vim.cmd("NullLsLog")
    end, { desc = "Show null-ls log" })

    vim.api.nvim_create_user_command("NullLsToggle", function()
      require("null-ls").toggle()
      print("Null-ls toggled")
    end, { desc = "Toggle null-ls" })
  end,
}
