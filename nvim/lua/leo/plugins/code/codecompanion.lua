return {
	"olimorris/codecompanion.nvim",
	event = "VeryLazy",
	opts = {
		strategies = {
			chat = {
				adapter = "anthropic",
			},
			inline = {
				adapter = "anthropic",
			},
		},
	},
	keys = {
		{ "<leader>aa", mode = { "v", "n" }, "<cmd>CodeCompanionChat Toggle<cr>" },
		{ "<leader>ai", mode = { "v" }, "<cmd>CodeCompanion<cr>" },
	},
}
