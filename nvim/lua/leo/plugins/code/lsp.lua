return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "zeioth/garbage-day.nvim", event = "VeryLazy" },
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"vtsls",
				"emmet_language_server",
				"rust_analyzer",
				"gopls",
				"typos_lsp",
				"tailwindcss",
				"svelte",
				"solidity_ls_nomicfoundation",
				"jsonls",
			},
			automatic_installation = true,
		},
	},
	{ "dmmulroy/ts-error-translator.nvim", opts = {} },
}
