return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		jump = {
			pos = "end",
			autojump = true,
		},
	},
  -- stylua: ignore
  keys = {
        { "<CR>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "<c-CR>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
