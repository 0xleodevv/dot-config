return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-e>"] = { "hide", "fallback" },
			cmdline = {
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
			menu = {
				auto_show = function(ctx)
					return ctx.mode ~= "cmdline"
				end,
			},
			documentation = { window = { border = "single" } },
		},
		signature = { enabled = true, window = { border = "single" } },
		sources = {
			default = function()
				local node = vim.treesitter.get_node()
				if
					node
					and vim.tbl_contains({ "comment", "line_comment", "comment_content", "block_comment" }, node:type())
				then
					return false
				else
					return { "lsp", "path", "buffer", "snippets" }
				end
			end,
		},

		enabled = function()
			return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
				and vim.bo.buftype ~= "prompt"
				and vim.b.completion ~= false
		end,
	},
	opts_extend = { "sources.default" },
}
