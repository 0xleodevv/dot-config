return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "rust_analyzer", "lua_ls", "solidity_ls" },
			})
		end,
	},
	{
		"antosha417/nvim-lsp-file-operations",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {
			excluded_lsp_clients = {
				"copilot",
			},
		},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup({
				options = {
					multilines = {
						enabled = true,
						always_show = true,
					},
				},
			})
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "dmmulroy/ts-error-translator.nvim" },
		lazy = false,
		config = function()
			-- better ts error messages
			require("ts-error-translator").setup()

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.typos_lsp.setup({
				-- Logging level of the language server. Logs appear in :LspLog. Defaults to error.
				cmd_env = { RUST_LOG = "error" },
				init_options = {
					-- Custom config. Used together with a config file found in the workspace or its parents,
					-- taking precedence for settings declared in both.
					-- Equivalent to the typos `--config` cli argument.
					config = "~/code/typos-lsp/crates/typos-lsp/tests/typos.toml",
					diagnosticSeverity = "Warning",
				},
				-- filetypes = { "markdown", "md", "solidity" },
			})

			lspconfig.svelte.setup({
				capabilities = capabilities,
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						cargo = {
							features = { "std", "e2e" },
						},
					},
				},
			})

			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
			})

			lspconfig.solidity_ls_nomicfoundation.setup({
				capabilities = capabilities,
				cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
				filetypes = { "solidity" },
				root_dir = lspconfig.util.find_git_ancestor,
				single_file_support = true,
			})

			-- lspconfig.solidity_ls.setup({
			-- 	capabilities = capabilities,
			-- 	root_dir = lspconfig.util.root_pattern("hardhat.config.js", "foundry.toml", ".git"),
			-- 	settings = {
			-- 		solidity = {
			-- 			compileUsingRemoteVersion = "latest",
			-- 			defaultCompiler = "remote",
			-- 			enabledAsYouTypeCompilationErrorCheck = true,
			-- 		},
			-- 	},
			-- })

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "Snacks" },
						},
					},
				},
			})

			-- Configure diagnostic signs
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.HINT] = "󰠠",
						[vim.diagnostic.severity.INFO] = "",
					},
					numhl = {
						[vim.diagnostic.severity.WARN] = "WarningMsg",
						[vim.diagnostic.severity.ERROR] = "ErrorMsg",
						[vim.diagnostic.severity.HINT] = "MoreMsg",
						[vim.diagnostic.severity.INFO] = "InfoMsg",
					},
				},
			})

			-- set keybinds
			local keymap = vim.keymap

			-- general lsp keybinds
			keymap.set("n", "<space>q", vim.diagnostic.open_float, { desc = "open floating diagnostics" })
			keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
			keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
		end,
	},
}
