return {
	"echasnovski/mini.nvim",
	dependencies = { "folke/ts-comments.nvim" },
	version = "*",
	config = function()
		require("ts-comments").setup()
		require("mini.surround").setup()
		require("mini.pairs").setup()
		require("mini.comment").setup()
		require("mini.ai").setup()
		require("mini.bracketed").setup()
		require("mini.cursorword").setup()
		require("mini.icons").mock_nvim_web_devicons()
	end,
}
