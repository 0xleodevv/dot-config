return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
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
	},
	keys = {
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Zen Mode",
		},
	},
}
