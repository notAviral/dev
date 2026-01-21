-- Language tools configuration
-- Format: lang = {
--   fmt = "formatter" | { "formatter1", "formatter2" },
--   lsp = "lsp_server" | { "lsp1", "lsp2" },
--   lsp_config = {},
--   lint = "linter" | { "linter1", "linter2" },
--   mason_fmt = "mason-package-name" (optional, if different from fmt),
--   mason_lint = "mason-package-name" (optional, if different from lint)
-- }

return {
    lua = {
        fmt = "stylua",
        lsp = "lua_ls",
        lsp_config = {},
        -- lint = "luacheck",
    },

    python = {
        fmt = { "black", "isort" },
        lsp = "basedpyright",
        lsp_config = {},
    },

    rust = {
        lsp = "rust_analyzer",
        lsp_config = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
    },

    javascript = {
        fmt = "prettier",
        lsp = "ts_ls",
        lsp_config = {},
        lint = "eslint_d",
    },

    typescript = {
        fmt = "prettier",
        lsp = "ts_ls",
        lsp_config = {},
        lint = "eslint_d",
    },

    shell = {
        fmt = "shfmt",
        lsp = "bashls",
        lsp_config = {},
        lint = "shellcheck",
    },

    zig = {
        lsp = "zls",
        lsp_config = {},
    },

    nix = {
        fmt = "nixpkgs_fmt",
        mason_fmt = "nixpkgs-fmt", -- Mason uses hyphens
        lsp = "nil_ls",
        lsp_config = {},
    },

    markdown = {
        fmt = "prettier",
        lint = "markdownlint",
    },

    html = {
        fmt = "prettier",
    },

    css = {
        fmt = "prettier",
        lint = "stylelint",
    },

    tailwindcss = {
        lsp = "tailwindcss",
        lsp_config = {},
    },

    java = {
        lsp = "jdtls",
        lsp_config = {},
    },

    php = {
        lsp = "phpactor",
        lsp_config = {},
    },

    c = {
        lsp = "clangd",
        lsp_config = {},
    },

    cpp = {
        lsp = "clangd",
        lsp_config = {},
    },

    opencl = {
        lsp = "opencl_ls",
        lsp_config = {},
    },

    glsl = {
        lsp = "glsl_analyzer",
        lsp_config = {},
    },

    arduino = {
        lsp = "arduino_language_server",
        lsp_config = {},
    },

    docker = {
        lsp = "dockerls",
        lsp_config = {},
    },
}
