return {
	"yetone/avante.nvim",
	event = "BufRead",
	version = false, -- Never set this value to "*"! Never!
	opts = { behaviour = {
		use_cwd_as_project_root = true,
	} },
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>ac", "<cmd>AvanteClear<cr>", desc = "🧼 Avante Clear Chat" },
	},
}
