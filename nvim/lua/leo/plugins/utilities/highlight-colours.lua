return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup({
			enable_tailwind = true,
			exclude_filetypes = { "cairo", "js", "ts", "json", "md", "toml" },
		})
	end,
}
