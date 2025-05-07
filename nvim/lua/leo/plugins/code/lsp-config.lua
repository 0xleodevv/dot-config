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
				ensure_installed = { "ts_ls", "lua_ls" },
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

			local servers = {
				svelte = true,
				jsonls = true,
				emmet_language_server = true,
				tailwindcss = true,
				ts_ls = true,
				html = true,
				gopls = true,
				typos_lsp = {
					cmd_env = { RUST_LOG = "error" },
					init_options = {
						config = "~/code/typos-lsp/crates/typos-lsp/tests/typos.toml",
						diagnosticSeverity = "Warning",
					},
				},
				rust_analyzer = true,
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim", "Snacks" },
							},
						},
					},
				},
				solidity_ls_nomicfoundation = {
					cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
					filetypes = { "solidity" },
					root_dir = lspconfig.util.find_git_ancestor,
					single_file_support = true,
				},
			}

			for name, config in pairs(servers) do
				if config then
					local opts = { capabilities = capabilities }
					if type(config) == "table" then
						for k, v in pairs(config) do
							opts[k] = v
						end
					end
					lspconfig[name].setup(opts)
				end
			end

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
			keymap.set("n", "K", function()
				vim.lsp.buf.hover({
					border = "rounded",
				})
			end, { desc = "Show documentation for what is under cursor" })
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
		end,
	},
}
