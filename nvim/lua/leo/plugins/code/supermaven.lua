return {
	"supermaven-inc/supermaven-nvim",
	event = "InsertEnter",
	opts = {
		condition = function()
			local bufname = vim.api.nvim_buf_get_name(0)
			local buftype = vim.bo.buftype

			if bufname == "" or buftype == "nofile" or buftype == "prompt" then
				return true
			end

			return false
		end,
	},
	keys = {
		{ "<leader>st", "<cmd>SupermavenToggle<cr>", desc = "Toggle SuperMaven" },
	},
}
