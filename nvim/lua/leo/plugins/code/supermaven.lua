-- return {
-- 	"supermaven-inc/supermaven-nvim",
-- 	event = "InsertEnter",
-- 	opts = {},
-- 	keys = {
-- 		{ "<leader>st", "<cmd>SupermavenToggle<cr>", desc = "Toggle SuperMaven" },
-- 	},
-- }
return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	event = "BufReadPost",
	opts = {
		suggestion = {
			keymap = {
				accept = "<Tab>",
			},
		},
		panel = { enabled = false },
		filetypes = {
			markdown = false,
			help = true,
		},
	},
}
