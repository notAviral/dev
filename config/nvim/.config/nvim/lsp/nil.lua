return {
    cmd = { "nil" },
    filetypes = { "nix" },
    root_markers = { "flake.nix", ".git" },
    settings = {
        ["nil"] = {
            formatting = {
                command = { "nixfmt" }, -- or { "alejandra" } if you prefer
            },
            nix = {
                maxMemoryMB = 3072,
                flake = {
                    autoArchive = true,
                    autoEvalInputs = false, -- set true if you want input pkgs evaluated (slower)
                },
            },
            diagnostics = {
                ignored = {}, -- e.g. { "unused_binding" } to silence specific lints
                excludedFiles = {},
            },
        },
    },
}
