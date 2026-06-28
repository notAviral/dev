return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		name = "RenderMardown",
		lazy = true,
		ft = "markdown",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
		opts = {
			render_modes = { "n", "c", "t" },
			completions = { blink = { enabled = false } },
			-- HEADINGS
			heading = {
				enabled = true,
				position = "inline",
				width = "full",
				-- padding = 0,
				backgrounds = {},
				icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
			},
			-- CODE BLOCKS
			code = {
				enabled = true,
				style = "full",
				width = "full",
				language = true,
				border = "hide",
				-- padding = 1,
				-- wrapper only (syntax still treesitter)
				highlight = "RenderMarkdownCode",
				highlight_inline = "RenderMarkdownCode",
			},
			latex = {
				enabled = true,
				highlight = "RenderMarkdownMath",
				position = "center",
				top_pad = 0,
				bottom_pad = 0,
			},
		},
	},
}
