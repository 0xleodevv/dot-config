return {
	{
		"projekt0n/github-nvim-theme",
		config = function()
			vim.cmd("colorscheme github_dark_default")
		end,
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "darker",
				transparent = true,
				code_style = {
					comments = "none",
				},
				lualine = {
					transparent = true,
				},
				highlights = {
					NormalFloat = { fg = "none", bg = "none" },
					FloatBorder = { fg = "none", bg = "none" },
					["@comment"] = { fg = "#798191" },
				},
			})
			-- vim.cmd("colorscheme onedark")
		end,
	},
}
