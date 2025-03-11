return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = { enabled = true },
		bigfile = { enabled = true },
		indent = { enabled = true, indent = { char = "┊" }, scope = {
			char = "┊",
		} },
		picker = {},
		input = {},
		zen = {
			win = {
				backdrop = {
					transparent = false,
				},
			},
			toggles = {
				dim = false,
			},
		},
		dashboard = {
			preset = {
				keys = {
					{ key = "c", icon = "   Nvim Config", action = "<cmd>:cd ~/.config/nvim | :edit init.lua <CR>" },
					{
						key = "g",
						icon = "   Ghostty Config",
						action = "<cmd>:cd ~/.config/ghostty | :edit config <CR>",
					},
					{
						key = "t",
						icon = "   Tmux Config",
						action = "<cmd>:cd ~/.config/tmux | :edit tmux.conf <CR>",
					},
					{ key = "u", icon = "󰂖   Update plugins", action = "<cmd>lua require('lazy').sync()<CR>" },
					{ key = "q", icon = "   Quit NVIM", action = ":qa<CR>" },
				},
				header = [[
     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⢾⢿⢟⢝⠻⢓⠲⢤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣆⢛⡇⡡⠑⠠⠀⠀⠈⠻⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⢆⣿⣟⣫⣞⡝⢵⡈⡄⠀⠀⠀⠀⡙⣻⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣾⣿⣿⣿⣿⣿⣿⣻⣝⣇⠥⠡⠠⠐⡀⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣧⢿⢿⣿⣿⣿⣿⣿⣿⣿⡷⠓⢩⡭⠄⠢⠘⣷⡀⠀⠀⠀⠀⠀⣠⡴⠟⣻⡿⡿⣿⣦⡀⠀⠀⠀⠀⠀⠀
     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣯⣳⣝⡿⣿⣿⣿⡿⣿⡿⡉⢐⠙⠳⢓⠀⢂⠨⡿⣦⠀⠀⠀⢰⠋⣄⡤⠖⠲⢍⠑⡻⣿⡄⠀⠀⠀⠀⠀
     ⠀⠀⠀⣀⡤⠖⠒⡒⡒⡢⣤⡀⠀⠈⠻⢿⣿⣽⣿⣿⣿⣿⢆⣼⣮⣄⠸⡅⠄⢠⢸⣽⠇⠀⠀⠀⢸⠀⣼⡀⠀⠀⠀⢱⠩⣿⣼⠀⠀⠀⠀⠀
     ⠀⢠⡾⠋⣤⠞⠛⠉⠉⠛⠳⣌⣢⡀⠀⠀⠉⠙⠛⠛⢿⣿⣾⣿⣾⣿⣷⢧⠅⢨⡀⡏⠀⣠⡄⠀⠈⢧⡳⣻⡄⠀⠀⢸⢐⣺⣿⠁⠀⠀⠀⠀
     ⢠⣿⠡⣽⠃⠀⠀⠀⠀⠀⠀⠈⣧⢷⠀⠀⠀⠀⣀⣴⣿⣿⣿⣷⠭⠿⣗⢡⣁⠀⢮⣧⠀⣿⡁⠀⠀⠀⠹⡜⣿⡀⠀⢸⢐⣺⣿⠀⠀⠀⠀⠀
     ⣼⡇⡊⣿⠀⠀⠀⠀⠀⠀⠀⠀⣼⣼⠀⣠⡴⣿⣿⣾⣾⢏⢿⡷⣒⢙⣓⣓⡪⠀⢺⡾⣦⢻⣟⣦⣤⣤⢴⣷⡿⠁⣰⢃⣢⣿⠏⠀⠀⠀⠀⠀
     ⣿⡇⠂⠸⡄⠀⠀⠀⠀⠠⣤⣾⠿⢃⣞⣷⢿⢫⣿⡿⠣⢒⠽⣊⠅⠀⢲⣶⡍⠓⠀⢯⡪⢳⢭⣛⣛⣛⣛⣋⡵⠚⠁⢴⣮⢏⣴⠶⠶⣦⣄⠀
     ⢻⠿⡐⠄⠹⣄⡀⠀⠀⠀⠀⢀⣠⠾⣫⢞⣾⡾⠋⢤⢊⣷⣿⡆⠀⣫⣵⣶⣶⣌⣅⢸⣷⣷⡢⡈⣉⠉⠉⡀⡠⢐⣨⠟⠁⠘⢧⡶⠀⠈⢻⣣
     ⠈⢿⣿⣬⡢⡀⠙⠓⠶⠶⠚⡉⣠⣸⣯⡿⠋⢀⠢⣡⣿⣿⣿⠃⡮⣿⣿⡿⣿⣿⡨⡋⢿⣿⣿⡿⠾⠶⠷⠷⠛⠉⠀⠀⣀⣀⣀⣀⡀⠀⣸⢿
     ⠀⠀⠑⠯⣾⣷⣷⣴⣦⠴⠼⠷⠛⠋⡁⡰⢐⣥⣾⣿⣿⣿⠃⣴⣪⣿⡯⠔⣹⣟⣇⢮⡈⢿⣷⣿⣦⡀⠀⠀⠀⢀⡠⠊⣡⣶⠤⠬⠭⠽⠽⠃
     ⠀⠀⠀⠀⡬⠛⡩⡡⠄⢄⣴⣀⣖⣚⣬⣶⣿⣿⣿⡵⠋⣁⣔⣿⣿⡿⣙⢡⢿⣿⣿⡔⠦⡈⢿⣷⣷⣹⣓⢒⢒⢋⣴⣗⠟⠁⠀⠀⠀⠀⠀⠀
     ⠀⠀⠀⡞⠀⣺⣷⠿⠯⣽⣿⡿⠿⠿⠟⣿⣿⠟⢉⣤⢜⣽⣿⣿⡿⠥⢳⣾⡿⠋⢿⣿⡆⠪⢆⠙⠻⢿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀
     ⠀⠀⢰⣇⢐⣾⠁⣰⣫⠟⠓⢮⣳⡀⢠⠟⢠⣶⣵⣷⣟⣿⣿⠟⣡⣴⣿⠟⠁⠀⠈⠻⣿⣧⣤⡑⠓⣄⢤⢉⢙⠲⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀
     ⠀⠀⠀⣿⣦⡹⣄⢻⣳⣈⣿⠈⡇⡇⡏⠰⣻⡿⡭⢛⣽⠏⣤⣾⠿⠏⠁⢠⣔⣦⣴⡲⣄⠙⠿⣯⣿⣲⣖⣶⢥⣕⢌⠻⣄⠀⠀⠀⠀⠀⠀⠀
     ⠀⠀⠀⠘⢿⣷⣟⡺⢭⣿⣥⢾⣵⣿⣇⡋⣿⣾⠁⣾⢓⣽⡟⠋⠀⠀⠀⣧⠋⠁⠈⠙⣮⢣⠀⠀⢈⡩⢍⡉⠙⢿⣷⠤⢹⡄⠀⠀⠀⠀⠀⠀
     ⠀⠀⠀⠀⠀⠙⠻⠿⠷⠷⠿⠛⣽⡟⣇⠅⣿⣧⠀⣿⡅⡏⠀⠀⡤⣖⣲⣷⡷⠶⠆⠀⢸⣺⡆⣴⢫⠏⠉⠉⠀⠀⣿⠨⢸⡇⠀⠀⠀⠀⠀⠀
     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⣿⣿⠿⡬⡹⡼⣄⢿⣦⠱⣄⣞⣼⠏⠉⢻⣷⠀⠀⢀⣾⣾⠙⣿⢨⠀⠀⠀⠀⣰⠏⣢⡿⠀⠀⠀⠀⠀⠀⠀
     ⠀⠀⠀⠀⠀⠀⠀⠀⣾⡟⠁⢠⣿⡿⠀⠹⢮⣙⡻⠽⢿⣷⣌⠻⢿⣀⣰⠟⣃⣀⢤⣪⣿⠇⠀⠻⣪⣗⡦⠤⢞⣫⣶⡟⠁⠀⠀⠀⠀⠀⠀⠀
     ⠀⠀⠀⠀⠀⠀⠀⠀⠻⣷⣶⣫⠟⠁⠀⠀⠀⠙⠛⠛⠛⠛⠻⣿⣾⣼⣭⡭⣿⣷⠻⠟⠁⠀⠀⠀⠈⠛⠻⠿⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
	},
	keys = {
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Zen Mode",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files({
					untracked = true,
					submodules = false,
				})
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>fa",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fo",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Todo",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fD",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.lsp_symbols({ layout = { preset = "vscode", preview = "main" } })
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>fM",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "Workspace LSP Symbols",
		},
		{
			"<leader>gc",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>fu",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo",
		},
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
