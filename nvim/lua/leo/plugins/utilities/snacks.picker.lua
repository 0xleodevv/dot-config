return {
	{
		"dmtrKovalenko/fff.nvim",
		build = "cargo build --release",
		opts = {},
		keys = {
			{
				"<leader>ff",
				-function()
					require("fff").find_files() -- or find_in_git_root() if you only want git files
				end,
				desc = "Open file picker",
			},
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
		keys = {
		--stylua: ignore
		-- { "<leader>fg", function() Snacks.picker.git_files({ untracked = true, submodules = false }) end, desc = "Find Git Files" },
		--stylua: ignore
		{ "<leader>ee", function() Snacks.explorer() end, desc = "File Explorer",},
		--stylua: ignore
		-- { "<leader>ff", function() Snacks.picker.files() end, desc = "Find All Files" },
		--stylua: ignore
		-- { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
		--stylua: ignore
		{ "<leader>fa", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
		--stylua: ignore
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		--stylua: ignore
		{ "<leader>ft", function() Snacks.picker.todo_comments() end, desc = "Todo" },
		--stylua: ignore
		{ "<leader>fs", function() Snacks.picker.grep() end, desc = "Grep" },
		--stylua: ignore
		{ "<leader>fD", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
		--stylua: ignore
		{ "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
		--stylua: ignore
		{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        --stylua: ignore
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
		--stylua: ignore
		{ "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
		--stylua: ignore
		{ "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
		--stylua: ignore
		{ "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        --stylua: ignore
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
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
		--stylua: ignore
		{ "<leader>fM", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace LSP Symbols" },
		--stylua: ignore
		{ "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git Log" },
		--stylua: ignore
		{ "<leader>fu", function() Snacks.picker.undo() end, desc = "Undo" },
		},
	},
}
