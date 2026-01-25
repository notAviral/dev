local M = {}

local builtin = require("telescope.builtin")

-- Helper function to check if input is a path
local function is_path(str)
    return str:match("^/") or str:match("^~/") or str:match("^%./") or str:match("^%.%./")
end

-- Helper function to expand path
local function expand_path(path)
    return vim.fn.expand(path)
end

-- Vertical split
M.verticalSplit = function()
    vim.keymap.set("n", "<leader>vs", function()
        builtin.find_files({
            attach_mappings = function(_, map)
                map("i", "<CR>", function(prompt_bufnr)
                    local action_state = require("telescope.actions.state")
                    local actions = require("telescope.actions")
                    local picker = action_state.get_current_picker(prompt_bufnr)
                    local input = picker:_get_prompt()

                    -- Check if input is a path
                    if is_path(input) then
                        actions.close(prompt_bufnr)
                        local file_path = expand_path(input)
                        vim.cmd("vsplit " .. vim.fn.fnameescape(file_path))
                    else
                        -- Normal telescope selection
                        local selection = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        vim.cmd("vsplit " .. selection.path)
                    end
                end)
                return true
            end,
        })
    end)
end

-- Horizontal split
M.horizontalSplit = function()
    vim.keymap.set("n", "<leader>hs", function()
        builtin.find_files({
            attach_mappings = function(_, map)
                map("i", "<CR>", function(prompt_bufnr)
                    local action_state = require("telescope.actions.state")
                    local actions = require("telescope.actions")
                    local picker = action_state.get_current_picker(prompt_bufnr)
                    local input = picker:_get_prompt()

                    -- Check if input is a path
                    if is_path(input) then
                        actions.close(prompt_bufnr)
                        local file_path = expand_path(input)
                        vim.cmd("split " .. vim.fn.fnameescape(file_path))
                    else
                        -- Normal telescope selection
                        local selection = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        vim.cmd("split " .. selection.path)
                    end
                end)
                return true
            end,
        })
    end)
end

return M
