return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		event = "VeryLazy",
		keys = {
			{ "<leader>ef", ":Neotree filesystem reveal float<CR>", silent = true, desc = "Float File Explorer" },
			{ "<leader>ee", ":Neotree filesystem reveal toggle left<CR>", silent = true, desc = "Left File Explorer" },
		},
		config = function()
			require("nvim-web-devicons").set_icon({
				cairo = {
					icon = "",
					color = "#EB5951",
					cterm_color = "65",
					name = "Cairo",
				},
			})
			require("neo-tree").setup({
				close_if_last_window = true,
				popup_border_style = "single",
				enable_git_status = true,
				enable_modified_markers = true,
				enable_diagnostics = true,
				sort_case_insensitive = true,
				default_component_configs = {
					indent = {
						with_markers = true,
						with_expanders = true,
					},
					modified = {
						symbol = " ",
						highlight = "NeoTreeModified",
					},
					icon = {
						folder_closed = " ",
						folder_open = " ",
						folder_empty = " ",
						folder_empty_open = " ",
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
				},
				window = {
					position = "float",
					width = 35,
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
					use_libuv_file_watcher = true,
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_by_name = {
							"node_modules",
						},
						never_show = {
							".DS_Store",
							"thumbs.db",
						},
					},
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
			})
		end,
	},
}
