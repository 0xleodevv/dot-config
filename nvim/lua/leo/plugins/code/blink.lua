return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	event = "InsertEnter",
	opts = {
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-e>"] = { "hide", "fallback" },
		},
		cmdline = {
			keymap = {
				["<Tab>"] = { "show", "select_next", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
			},
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { window = { border = "rounded" } },
			menu = {
				scrollbar = false,
				draw = {
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},
		},
		signature = { enabled = true, window = { border = "rounded" } },
		sources = {
			default = { "lsp", "path", "buffer", "snippets" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		enabled = function()
			return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
				and vim.bo.buftype ~= "prompt"
				and vim.bo.filetype ~= "AvantePromptInput"
				and vim.bo.filetype ~= "AvanteInput"
				and vim.b.completion ~= false
		end,
	},
	opts_extend = { "sources.default" },
}
