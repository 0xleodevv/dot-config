return {
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			require("ayu").setup({
				mirage = false,
				terminal = true,
				overrides = {
					LineNr = { fg = "#636A72" },
					NonText = { fg = "#636A72" },
					["@variable.member"] = { fg = "#D2A6FF" },
					["@lsp.type.struct.rust"] = { fg = "#04C5FF" },
					["@lsp.mod.constant.rust"] = { fg = "#FFAA33" },
				},
			})

			vim.cmd.colorscheme("ayu")
		end,
	},
	-- {
	-- 	"AlexvZyl/nordic.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("nordic").setup({
	-- 			-- transparent = {
	-- 			-- 	-- Enable transparent background.
	-- 			-- 	bg = true,
	-- 			-- 	-- Enable transparent background for floating windows.
	-- 			-- 	float = true,
	-- 			-- },
	-- 			on_palette = function(palette)
	-- 				palette.gray0 = "#0F111B"
	-- 				palette.black2 = "#0F111B"
	-- 				palette.black1 = "#0F111B"
	-- 			end,
	-- 			after_palette = function(palette)
	-- 				local U = require("nordic.utils")
	-- 				palette.bg_dap = U.blend(palette.green.base, palette.bg, 0.30)
	-- 			end,
	-- 			on_highlight = function(highlights, palette)
	-- 				highlights.FloatBorder = { fg = palette.white0 }
	-- 				highlights.MiniIconsGrey = { fg = palette.gray1 }
	-- 				highlights.MiniIconsPurple = { fg = palette.magenta.base }
	-- 				highlights.MiniIconsBlue = { fg = palette.blue0 }
	-- 				highlights.MiniIconsAzure = { fg = palette.blue1 }
	-- 				highlights.MiniIconsCyan = { fg = palette.cyan.base }
	-- 				highlights.MiniIconsGreen = { fg = palette.green.base }
	-- 				highlights.MiniIconsYellow = { fg = palette.yellow.base }
	-- 				highlights.MiniIconsOrange = { fg = palette.orange.base }
	-- 				highlights.MiniIconsRed = { fg = palette.red.base }
	-- 				highlights.CopilotSuggestion = { fg = palette.gray2 }
	-- 				highlights.MatchParen = { fg = palette.orange.base, bold = true }
	-- 				highlights["@injection.content.solidity"] = { fg = palette.red.base }
	-- 				highlights.AvanteSidebarWinSeparator = { fg = palette.white0 }
	-- 				highlights.DapStopped = {
	-- 					bg = palette.bg_dap,
	-- 				}
	-- 				highlights.Field = { fg = palette.magenta.base }
	-- 			end,
	-- 		})
	-- 		-- require("nordic").load()
	-- 	end,
	-- },
}
