return {
	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local groups = {
	-- 			all = {
	-- 				-- Special = { fg = "#5FC2FF" },
	-- 				["@include"] = { fg = "palette.red" },
	-- 				["@type.builtin.solidity"] = { fg = "#5FC2FF" },
	-- 				["@function.builtin.solidity"] = { fg = "palette.red" },
	-- 				FloatBorder = { fg = "palette.white" },
	-- 				NormalFloat = { bg = "bg1" },
	-- 				NeoTreeDirectoryIcon = { fg = "palette.magenta" },
	-- 				illuminatedWord = { bg = "sel0" },
	-- 				illuminatedCurWord = { bg = "sel0" },
	-- 				IlluminatedWordText = { bg = "sel0" },
	-- 				IlluminatedWordRead = { bg = "sel0" },
	-- 				IlluminatedWordWrite = { bg = "sel0" },
	-- 				CopilotSuggestion = { fg = "palette.gray" },
	-- 			},
	-- 		}
	-- 		require("github-theme").setup({ groups = groups })
	-- 	end,
	-- },
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				on_palette = function(palette)
					palette.gray0 = "#0F111B"
					palette.black2 = "#0F111B"
					palette.black1 = "#0F111B"
				end,
				on_highlight = function(highlights, palette)
					highlights.FloatBorder = { fg = palette.white0 }
					highlights.MiniIconsGrey = { fg = palette.gray1 }
					highlights.MiniIconsPurple = { fg = palette.magenta.base }
					highlights.MiniIconsBlue = { fg = palette.blue0 }
					highlights.MiniIconsAzure = { fg = palette.blue1 }
					highlights.MiniIconsCyan = { fg = palette.cyan.base }
					highlights.MiniIconsGreen = { fg = palette.green.base }
					highlights.MiniIconsYellow = { fg = palette.yellow.base }
					highlights.MiniIconsOrange = { fg = palette.orange.base }
					highlights.MiniIconsRed = { fg = palette.red.base }
					highlights.CopilotSuggestion = { fg = palette.gray2 }
					highlights.MatchParen = { fg = palette.orange.base, bold = true }
					highlights["@injection.content.solidity"] = { fg = palette.red.base }
					highlights.AvanteSidebarWinSeparator = { fg = palette.white0 }
					highlights.DapStopped = { link = "GitSignsAdd" }
				end,
			})
			require("nordic").load()
		end,
	},
}
