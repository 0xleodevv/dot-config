return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-e>"] = { "hide", "fallback" },
			cmdline = {
				["<Tab>"] = { "show", "accept", "fallback" },
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
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
			menu = {
				auto_show = function(ctx)
					return ctx.mode ~= "cmdline"
				end,
			},
		},
		signature = { enabled = true },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		enabled = function()
			return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
				and vim.bo.buftype ~= "prompt"
				and vim.b.completion ~= false
		end,
	},
	opts_extend = { "sources.default" },
}
