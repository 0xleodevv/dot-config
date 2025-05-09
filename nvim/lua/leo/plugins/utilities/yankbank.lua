return {
	"ptdewey/yankbank-nvim",
	dependencies = {
		"kkharji/sqlite.lua",
	},
	opts = {
		max_entries = 9,
		sep = "-----",
		num_behavior = "jump",
		focus_gain_poll = true,
		persist_type = "sqlite",
		keymaps = {
			paste = "<CR>",
			paste_back = "P",
		},
		registers = {
			yank_register = "+",
		},
	},
	keys = {
		{ "<leader>y", "<cmd>YankBank<CR>", desc = "Yank Bank" },
	},
}
