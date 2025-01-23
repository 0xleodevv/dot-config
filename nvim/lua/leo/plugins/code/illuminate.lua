return {
	"RRethy/vim-illuminate",
	config = function()
		-- default configuration
		require("illuminate").configure({
			-- providers: provider used to get references in the buffer, ordered by priority
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			-- delay: delay in milliseconds
			delay = 100,

			-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
			filetypes_denylist = {
				"dirbuf",
				"dirvish",
				"fugitive",
			},

			under_cursor = true,

			min_count_to_highlight = 2,

			should_enable = function(bufnr)
				return true
			end,
			-- case_insensitive_regex: sets regex case sensitivity
			case_insensitive_regex = false,
		})
	end,
}
