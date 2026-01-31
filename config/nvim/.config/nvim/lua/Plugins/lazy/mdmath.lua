return {
	"Thiago4532/mdmath.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- Filetypes that the plugin will be enabled by default.
		filetypes = { "markdown" },
		-- Color of the equation, can be a highlight group or a hex color.
		-- Examples: 'Normal', '#ff0000'
		foreground = "Normal",
		-- Hide the text when the equation is under the cursor.
		anticonceal = true,
		-- Hide the text when in the Insert Mode.
		hide_on_insert = true,
		-- Enable dynamic size for non-inline equations.
		dynamic = true,
		-- Configure the scale of dynamic-rendered equations.
		dynamic_scale = 0.8,
		-- Interval between updates (milliseconds).
		update_interval = 400,

		internal_scale = 1.0,
	},
}
