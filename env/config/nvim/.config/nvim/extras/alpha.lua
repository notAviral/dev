return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[      __  __           _ __  __             _      ____                 ]],
      [[     |  \/  | __ _  __| |  \/  | ___  _ __ | | __ |  _ \  _____   __    ]],
      [[     | |\/| |/ _` |/ _` | |\/| |/ _ \| '_ \| |/ / | | | |/ _ \ \        ]],
      [[     | |  | | (_| | (_| | |  | | (_) | | | |   < _| |_| |  __/\ V /     ]],
      [[     |_|  |_|\__,_|\__,_|_|  |_|\___/|_| |_|_|\_(_)____/ \___| \_/      ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    alpha.setup(dashboard.opts)
    -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
      dashboard.button("n", " " .. " New file",        [[<cmd> ene <BAR> startinsert <cr>]]),
      dashboard.button("r", " " .. " Recent files",    [[<cmd> Telescope oldfiles <cr>]]),
      dashboard.button("g", " " .. " Find text",       [[<cmd> Telescope live_grep <cr>]]),
      dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 8
    return dashboard
  end
  }
