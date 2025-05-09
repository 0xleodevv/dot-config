return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	event = "VeryLazy",
	keys = {
		{ "<leader>ef", ":Neotree filesystem reveal float<CR>", silent = true, desc = "Float File Explorer" },
		{ "<leader>ee", ":Neotree filesystem reveal toggle left<CR>", silent = true, desc = "Left File Explorer" },
	},
	lazy = false, -- neo-tree will lazily load itself
	---@module "neo-tree"
	opts = {
		close_if_last_window = true,
		sort_case_insensitive = true,
		enable_modified_markers = true,
		window = {
			position = "float",
			width = 35,
		},
		default_component_configs = {
			modified = {
				symbol = "",
				highlight = "NeoTreeModified",
			},
			icon = {
				provider = function(icon, node) -- setup a custom icon provider
					local text, hl
					local mini_icons = require("mini.icons")
					if node.type == "file" then -- if it's a file, set the text/hl
						text, hl = mini_icons.get("file", node.name)
					elseif node.type == "directory" then -- get directory icons
						text, hl = mini_icons.get("directory", node.name)
						-- only set the icon text if it is not expanded
						if node:is_expanded() then
							text = nil
						end
					end

					-- set the icon text/highlight only if it exists
					if text then
						icon.text = text
					end
					if hl then
						icon.highlight = hl
					end
				end,
			},
			kind_icon = {
				provider = function(icon, node)
					local mini_icons = require("mini.icons")
					icon.text, icon.highlight = mini_icons.get("lsp", node.extra.kind.name)
				end,
			},
		},
		git_status = {
			symbols = {
				-- Change type
				added = "",
				deleted = "",
				modified = "",
				renamed = "",
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
		},
		filesystem = {
			commands = {
				-- Override delete to use trash instead of rm
				delete = function(state)
					local inputs = require("neo-tree.ui.inputs")
					local path = state.tree:get_node().path
					local msg = "Are you sure you want to delete " .. path
					inputs.confirm(msg, function(confirmed)
						if not confirmed then
							return
						end

						vim.fn.system({
							"trash",
							vim.fn.fnameescape(path),
						})
						require("neo-tree.sources.manager").refresh(state.name)
					end)
				end,
			},
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			source_selector = {
				winbar = true,
				sources = {
					{ source = "filesystem", display_name = "   Files " },
					{ source = "git_status", display_name = "   Git " },
				},
			},
			event_handlers = {
				{
					event = "neo_tree_window_after_open",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end,
				},
				{
					event = "neo_tree_window_after_close",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end,
				},
			},
		},
	},
}
