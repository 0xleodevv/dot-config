return {
	{
		"projekt0n/github-nvim-theme",
		config = function()
			local groups = {
				all = {
					-- Special = { fg = "#5FC2FF" },
					["@include"] = { fg = "palette.red" },
					["@type.builtin.solidity"] = { fg = "#5FC2FF" },
					FloatBorder = { fg = "palette.white" },
					NormalFloat = { bg = "bg1" },
					NeoTreeDirectoryIcon = { fg = "palette.magenta" },
					illuminatedWord = { bg = "sel0" },
					illuminatedCurWord = { bg = "sel0" },
					IlluminatedWordText = { bg = "sel0" },
					IlluminatedWordRead = { bg = "sel0" },
					IlluminatedWordWrite = { bg = "sel0" },
				},
			}
			require("github-theme").setup({ groups = groups })
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
