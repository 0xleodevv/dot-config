return {
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			local groups = {
				all = {
					-- Special = { fg = "#5FC2FF" },
					["@include"] = { fg = "palette.red" },
					["@type.builtin.solidity"] = { fg = "#5FC2FF" },
					["@function.builtin.solidity"] = { fg = "palette.red" },
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
		"marko-cerovac/material.nvim",
		lazy = false,
		priority = 1000,
		config = function() end,
	},
}
