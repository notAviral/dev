local M = {}

-- LSP Servers Native
M.servers = {
    "lua_ls",
    "clangd",
    "rust_analyser",
    "gopls",
    "org",
    "qmlls",
    "nil",
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
    "qmljs",
    "nix"
}

-- Formatters (Conform backend)
M.formatters = {
    c      = { "clang-format" },
    cpp    = { "clang-format" },
    go     = { "gofumpt", "goimports" },
    rust   = { "rustfmt" },
    lua    = { "stylua" },
    python = { "ruff" },
    nix    = { "nixfmt" },
}

-- Linters (nvim-lint backend)
M.linters = {
    c      = { "clangtidy" },
    cpp    = { "clangtidy" },
    go     = {},
    lua    = { "luacheck" },
    python = { "ruff" },
    nix    = { "statix" },
}

-- Mason Packages
M.packages = {
    -- lsp
    "clangd",
    "gopls",
    "rust-analyzer",
    "lua-language-server",
    "qmlls",
    "nil",
    -- formatters
    "clang-format",
    "gofumpt",
    "goimports",
    "stylua",
    "ruff",
    "nixfmt",
    -- linters
    "golangci-lint",
    "luacheck",
    "statix",
}

return M
