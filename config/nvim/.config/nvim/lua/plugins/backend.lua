return {
    {
        "mistweaverco/kulala.nvim",
        event = { "SessionLoadPost", "VimLeavePre" },
        keys = {
            { "<leader>Rs", desc = "Send request" },
            { "<leader>Ra", desc = "Send all requests" },
            { "<leader>Rb", desc = "Open scratchpad" },
        },
        ft = { "http", "rest", "go", "lua" },
        opts = {
            kulala_core = {
                path = nil,
                timeout = 60000,
                data_dir = nil,
                download_url = "https://github.com/mistweaverco/kulala-core/releases/download/%s/%s",
                download_tool = "curl",
            },
            session = {
                restore = true,
            },
            treesitter = {
                enable = true,
                cli_path = "tree-sitter",
            },
            default_env = "default",
            environment_scope = "b",
            vscode_rest_client_environmentvars = false,
            response_format = {
                indent = 2,
                expand_tabs = true,
                sort_keys = false,
            },
            ui = {
                display_mode = "split",
                split_direction = "right",
                win_opts = { bo = {}, wo = {} }, ---@type kulala.ui.win_config
                default_view = "body", ---@type "body"|"headers"|"headers_body"|"verbose"|fun(response: Response)
                winbar = true,
                default_winbar_panes = { "body", "headers", "verbose", "script_output", "report" },
                winbar_labels = {
                    body = "Body",
                    headers = "Headers",
                    headers_body = "All",
                    verbose = "Verbose",
                    script_output = "Script Output",
                    stats = "Stats",
                    report = "Report",
                    help = "Help",
                },
                winbar_labels_keymaps = true,
                show_variable_info_text = false,
                show_icons = "on_request",
                icons = {
                    inlay = {
                        loading = "⏳",
                        done = "✔",
                        error = "✘",
                    },
                    lualine = "🐼",
                    textHighlight = "WarningMsg", -- highlight group for request elapsed time
                    loadingHighlight = "Normal",
                    doneHighlight = "String",
                    errorHighlight = "ErrorMsg",
                },

                show_request_summary = true,
                max_response_size = 32768,
                max_request_size = 2048,
                report = {
                    show_script_output = true,
                    show_asserts_output = true,
                    show_summary = true,

                    headersHighlight = "Special",
                    successHighlight = "String",
                    errorHighlight = "Error",
                },

                scratchpad_default_contents = {
                    "@MY_TOKEN_NAME=my_token_value",
                    "",
                    "# @name scratchpad",
                    "POST https://echo.kulala.app/post HTTP/1.1",
                    "accept: application/json",
                    "content-type: application/json",
                    "",
                    "{",
                    '  "foo": "bar"',
                    "}",
                },

                pickers = {
                    snacks = {
                        layout = function()
                            local has_snacks, snacks_picker = pcall(require, "snacks.picker")
                            return not has_snacks and {}
                                or vim.tbl_deep_extend("force", snacks_picker.config.layout("telescope"), {
                                    reverse = true,
                                    layout = {
                                        { { win = "list" }, { height = 1, win = "input" }, box = "vertical" },
                                        { win = "preview",  width = 0.6 },
                                        box = "horizontal",
                                        width = 0.8,
                                    },
                                })
                        end,
                    },
                },
            },

            lsp = {
                ---@type boolean
                enable = true,
                ---@type string[]
                filetypes = {
                    "http",
                    "rest",
                    "go",
                    "lua",
                },

                ---@type boolean
                enforce_external_script_naming_convention = true,

                ---@type boolean|table
                keymaps = false, -- disabled by default, as Kulala relies on default Neovim LSP keymaps

                on_attach = nil, -- function called when Kulala LSP attaches to the buffer
            },

            -- enable/disable debug mode
            debug = 3,
            -- enable/disable bug reports on all errors
            generate_bug_report = false,

            -- set to true to enable default keymaps
            -- (see docs or lua/kulala/config/keymaps.lua)
            -- or override default keymaps as shown in the example below.
            ---@type boolean|table
            global_keymaps = false,
            --[[
        {
          ["Send request"] = { -- sets global mapping
            "<leader>Rs",
            function() require("kulala").run() end,
            mode = { "n", "v" }, -- optional mode, default is n
            desc = "Send request" -- optional description, otherwise inferred from the key
          },
          ["Send all requests"] = {
            "<leader>Ra",
            function() require("kulala").run_all() end,
            mode = { "n", "v" },
            ft = "http", -- sets mapping for *.http files only
          },
          ["Replay the last request"] = {
            "<leader>Rr",
            function() require("kulala").replay() end,
            ft = { "http", "rest" }, -- sets mapping for specified file types
          },
        ["Find request"] = false -- set to false to disable
        },
      ]]

            -- Prefix for global keymaps
            global_keymaps_prefix = "<leader>R",

            -- Kulala UI keymaps; override with custom keymaps as required
            -- (see docs or lua/kulala/config/keymaps.lua)
            ---@type boolean|table
            kulala_keymaps = true,
            --[[
        {
          ["Show headers"] = { "H", function() require("kulala.ui").show_headers() end, },
        }
      ]]

            kulala_keymaps_prefix = "",
        },
    },
}
