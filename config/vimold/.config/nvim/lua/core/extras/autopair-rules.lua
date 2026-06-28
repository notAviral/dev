local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

-- Add $ autopair only for markdown files
npairs.add_rules({
	Rule("$", "$", { "markdown", "tex" }),
})
