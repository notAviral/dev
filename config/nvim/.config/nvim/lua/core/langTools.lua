local M = {}

-- LSP Servers Native
M.servers = {
    "lua_ls",
    "clangd",
    "rust_analyser",
    "gopls",
    "org",
}

-- Treesitter parsers
M.parsers = {
    "rust",
    "c",
    "go",
    "cpp",
    "markdown",
    "markdown_inline",
    "latex",
    "python",
    "toml",
    "yaml",
    "lua",
    "bash",
}

-- Formatters (Conform backend)
M.formatters = {
    c      = { "clang-format" },
    cpp    = { "clang-format" },
    go     = { "gofumpt", "goimports" },
    rust   = { "rustfmt" },
    lua    = { "stylua" },
    python = { "ruff" },
}

-- Linters (nvim-lint backend)
M.linters = {
    c      = { "clangtidy" },
    cpp    = { "clangtidy" },
    go     = {},
    lua    = { "luacheck" },
    python = { "ruff" },
}

-- Mason Packages
M.packages = {
    -- lsp
    "clangd",
    "gopls",
    "rust-analyzer",
    "lua-language-server",
    -- formatters
    "clang-format",
    "gofumpt",
    "goimports",
    "stylua",
    "ruff",
    -- linters
    "golangci-lint",
    "luacheck",
}

return M
