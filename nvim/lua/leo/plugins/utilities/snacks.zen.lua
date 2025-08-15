return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		zen = {
			win = {
				width = 130,
				backdrop = {
					transparent = false,
				},
			},
			toggles = {
				dim = false,
			},
		},
	},
    --stylua: ignore
	keys = {
		{ "<leader>z", function() Snacks.zen() end, desc = "Zen Mode" },
	},
}
