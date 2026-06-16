return {
	"RedsXDD/neopywal.nvim",
	name = "neopywal",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("neopywal").setup({

			use_palette = "wallust",

			transparent_background = true,
			defualt_fileformats = true,

			plugins = {
				markdown = true,
			},
		})
	end,
}
