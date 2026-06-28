--- Agents Keybinds ---

-- Copilot chat 
vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChat<CR>", { desc = "Copilot: Chat with copilot" })
vim.keymap.set("v", "<leader>ce", "<cmd>CopilotChatExplain<CR>", { desc = "Copilot: Explain Code" })
vim.keymap.set("v", "<leader>cr", "<cmd>CopilotChatReview<CR>", { desc = "Copilot: Riview Code" })
vim.keymap.set("v", "<leader>cf", "<cmd>CopilotChatFix<CR>", { desc = "Copilot: Code Fixes" })
vim.keymap.set("v", "<leader>cd", "<cmd>CopilotChatDocs<CR>", { desc = "Copilot: Generate Documentation" })
vim.keymap.set("v", "<leader>cT", "<cmd>CopilotChatTests<CR>", { desc = "Copilot: Generate Tests" })
vim.keymap.set("n", "<leader>cm", "<cmd>CopilotChatCommit<CR>", { desc = "Copilot: Generate Messages" })
vim.keymap.set("n", "<leader>ct", function()
	if vim.g.copilot_enabled then
		vim.cmd("Copilot disable")
		vim.g.copilot_enabled = false
		print("Copilot disabled")
	else
		vim.cmd("Copilot enable")
		vim.g.copilot_enabled = true
		print("Copilot enabled")
	end
end)
