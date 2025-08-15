return {
	{
		"dmtrKovalenko/fff.nvim",
		build = "cargo build --release",
		opts = {
			keymaps = {
				move_up = { "<C-k>" },
				move_down = { "<C-j>" },
			},
		},
        --stylua: ignore
		keys = {
			{ "<leader>ff", function() require("fff").find_files() end, desc = "Open file picker" },
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			picker = {
				sources = {
					explorer = {},
				},
				matcher = {
					cwd_bonus = true,
				},
			},
		},
		config = function(_, opts)
			require("snacks").setup(opts)
			vim.api.nvim_create_autocmd("QuitPre", {
				callback = function()
					local snacks_windows = {}
					local floating_windows = {}
					local windows = vim.api.nvim_list_wins()
					for _, w in ipairs(windows) do
						local filetype =
							vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_win_get_buf(w) })
						if filetype:match("snacks_") ~= nil then
							table.insert(snacks_windows, w)
						elseif vim.api.nvim_win_get_config(w).relative ~= "" then
							table.insert(floating_windows, w)
						end
					end
					if
						1 == #windows - #floating_windows - #snacks_windows
						and vim.api.nvim_win_get_config(vim.api.nvim_get_current_win()).relative == ""
					then
						for _, w in ipairs(snacks_windows) do
							vim.api.nvim_win_close(w, true)
						end
					end
				end,
			})
		end,
        -- stylua: ignore
		keys = {
            -- { "<leader>fg", function() Snacks.picker.git_files({ untracked = true, submodules = false }) end, desc = "Find Git Files" },
            -- { "<leader>ff", function() Snacks.picker.files() end, desc = "Find All Files" },
            -- { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
            { "<leader>ee", function() Snacks.explorer() end,                    desc = "File Explorer", },
            { "<leader>fa", function() Snacks.picker.diagnostics() end,          desc = "Diagnostics" },
            { "<leader>fb", function() Snacks.picker.buffers() end,              desc = "Buffers" },
            { "<leader>ft", function() Snacks.picker.todo_comments() end,        desc = "Todo" },
            { "<leader>fs", function() Snacks.picker.grep() end,                 desc = "Grep" },
            { "<leader>fD", function() Snacks.picker.diagnostics() end,          desc = "Diagnostics" },
            { "<leader>fd", function() Snacks.picker.diagnostics_buffer() end,   desc = "Buffer Diagnostics" },
            { "gd",         function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition" },
            { "gD",         function() Snacks.picker.lsp_declarations() end,     desc = "Goto Declaration" },
            { "gr",         function() Snacks.picker.lsp_references() end,       nowait = true,                  desc = "References" },
            { "gI",         function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
            { "gy",         function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
            { "<leader>sk", function() Snacks.picker.keymaps() end,              desc = "Keymaps" },
            { "<leader>fM", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace LSP Symbols" },
            { "<leader>gc", function() Snacks.picker.git_log() end,               desc = "Git Log" },
            { "<leader>fu", function() Snacks.picker.undo() end,                  desc = "Undo" },
			{
				"<leader>fm",
				function()
					Snacks.picker.lsp_symbols({
						layout = { preset = "vscode", preview = "main" },
						filter = {
							go = {
								"Class",
								"Constructor",
								"Enum",
								"Function",
								"Interface",
								"Method",
								"Module",
								"Namespace",
								"Property",
								"Struct",
								"Trait",
							},
						},
					})
				end,
				desc = "LSP Symbols",
			},
		},
	},
}
