local M = {}

local builtin = require("telescope.builtin")

local function is_path(str)
	return str:match("^/") or str:match("^~/") or str:match("^%./") or str:match("^%.%./")
end

local function expand_path(path)
	return vim.fn.expand(path)
end

local function open_with_split(split_cmd)
	return function()
		builtin.find_files({
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local action_state = require("telescope.actions.state")
					local actions = require("telescope.actions")

					local picker = action_state.get_current_picker(prompt_bufnr)
					local input = picker:_get_prompt()

					actions.close(prompt_bufnr)

					if is_path(input) then
						local file_path = expand_path(input)
						vim.cmd(split_cmd .. " " .. vim.fn.fnameescape(file_path))
					else
						local selection = action_state.get_selected_entry()
						if selection then
							vim.cmd(split_cmd .. " " .. vim.fn.fnameescape(selection.path))
						end
					end
				end)

				return true
			end,
		})
	end
end

M.verticalSplit = open_with_split("vsplit")
M.horizontalSplit = open_with_split("split")

return M
