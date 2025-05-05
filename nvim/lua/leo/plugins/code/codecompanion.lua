return {
	"olimorris/codecompanion.nvim",
	opts = {},
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "anthropic",
				},
				inline = {
					adapter = "anthropic",
				},
			},
		})
		vim.keymap.set("n", "<leader>aa", ":CodeCompanionChat Toggle <CR>")
		vim.keymap.set("v", "<leader>ai", ":CodeCompanion <CR>")
	end,
}
