return {
	-- {
	-- 	"folke/ts-comments.nvim",
	-- 	event = "BufEnter",
	-- 	config = true,
	-- },
	{
		"nvim-mini/mini.nvim",
		version = "*",
		event = "VeryLazy",
		config = function()
			-- Each mini module as separate setup call
			require("mini.surround").setup()
			require("mini.pairs").setup()
			require("mini.comment").setup()
			require("mini.ai").setup()
			require("mini.bracketed").setup()
			require("mini.cursorword").setup()
			require("mini.icons").setup()
			require("mini.icons").mock_nvim_web_devicons()
		end,
	},
}
