return {
	"brenoprata10/nvim-highlight-colors",
	event = "BufRead",
	opts = {
		enable_tailwind = true,
		exclude_filetypes = { "cairo", "js", "ts", "json", "md", "toml", "sol" },
	},
}
