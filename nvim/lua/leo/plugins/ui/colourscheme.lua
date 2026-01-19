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
					Comment = { italic = false },
				},
			})

			vim.cmd.colorscheme("ayu")
		end,
	},
}
