return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = { enabled = true },
		-- bigfile = { enabled = true },
		indent = { enabled = true, indent = { char = "┊" }, scope = {
			char = "┊",
		} },
		input = {},
	},
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
