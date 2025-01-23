return {
	{ "Shatur/neovim-ayu" },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				highlight_groups = {
					-- ["@type"] = { fg = "rose" },
					["@variable.member"] = { fg = "iris" },
					["@property"] = { fg = "iris" },
				},
			})
			-- main = {
			-- 	_nc = "#16141f",
			-- 	base = "#191724",
			-- 	surface = "#1f1d2e",
			-- 	overlay = "#26233a",
			-- 	muted = "#6e6a86",
			-- 	subtle = "#908caa",
			-- 	text = "#e0def4",
			-- 	love = "#eb6f92",
			-- 	gold = "#f6c177",
			-- 	rose = "#ebbcba",
			-- 	pine = "#31748f",
			-- 	foam = "#9ccfd8",
			-- 	iris = "#c4a7e7",
			-- 	leaf = "#95b1ac",
			-- 	highlight_low = "#21202e",
			-- 	highlight_med = "#403d52",
			-- 	highlight_high = "#524f67",
			-- 	none = "NONE",
			-- },
			vim.cmd("colorscheme rose-pine")
		end,
	},
}
