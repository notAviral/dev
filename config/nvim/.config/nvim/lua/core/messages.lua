-- Add these commands to your config for easy message viewing
-- Put this in your init.lua or a separate config file

-- Command to open messages in a split window
vim.api.nvim_create_user_command("Messages", function()
    -- Redirect messages to a register
    vim.cmd("redir => g:messages_output")
    vim.cmd("silent messages")
    vim.cmd("redir END")

    -- Create a new buffer
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(buf, "swapfile", false)

    -- Split and show the buffer
    vim.cmd("split")
    vim.api.nvim_win_set_buf(0, buf)

    -- Set the content
    local messages = vim.g.messages_output or "No messages"
    local lines = vim.split(messages, "\n")
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- Make it read-only
    vim.api.nvim_buf_set_option(buf, "modifiable", false)
    vim.api.nvim_buf_set_name(buf, "Messages")

    -- Set filetype for syntax highlighting
    vim.api.nvim_buf_set_option(buf, "filetype", "messages")
end, {})

-- Command to save messages to a file
vim.api.nvim_create_user_command("SaveMessages", function(opts)
    local filepath = opts.args ~= "" and opts.args or "/tmp/nvim_messages.txt"
    vim.cmd("redir > " .. filepath)
    vim.cmd("silent messages")
    vim.cmd("redir END")
    vim.notify("Messages saved to: " .. filepath, vim.log.levels.INFO)
end, { nargs = "?" })

-- Command to copy messages to clipboard
vim.api.nvim_create_user_command("CopyMessages", function()
    vim.cmd("redir @+")
    vim.cmd("silent messages")
    vim.cmd("redir END")
    vim.notify("Messages copied to clipboard!", vim.log.levels.INFO)
end, {})

-- Keybindings (optional - uncomment if you want them)
-- vim.keymap.set("n", "<leader>vm", "<cmd>Messages<cr>", { desc = "View messages" })
-- vim.keymap.set("n", "<leader>cm", "<cmd>CopyMessages<cr>", { desc = "Copy messages" })
