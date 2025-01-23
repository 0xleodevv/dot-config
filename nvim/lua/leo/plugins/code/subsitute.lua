return {
	"gbprod/substitute.nvim",
	opts = {
		-- Preserve default options
		on_substitute = nil,
		yank_substituted_text = false,
		preserve_cursor_position = false,
		modifiers = nil,
		highlight_substituted_text = {
			enabled = true,
			timer = 500,
		},
		range = {
			prefix = "r", -- Your custom prefix
			prompt_current_text = false,
			confirm = false,
			complete_word = false,
			subject = nil,
			range = nil,
			suffix = "",
			auto_apply = false,
			cursor_position = "end",
		},
		exchange = {
			motion = false,
			use_esc_to_cancel = true,
			preserve_cursor_position = false,
		},
	},
	config = function(_, opts)
		require("substitute").setup(opts)
		--  hello keymaps
		vim.keymap.set("n", "r", require("substitute").operator, { noremap = true })
		vim.keymap.set("n", "rr", require("substitute").line, { noremap = true })
		vim.keymap.set("n", "R", require("substitute").eol, { noremap = true })
		vim.keymap.set("x", "r", require("substitute").visual, { noremap = true })
	end,
}
