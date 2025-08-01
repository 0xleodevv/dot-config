return {
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	{ "https://github.com/sindrets/diffview.nvim", opts = {} },
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end
				map("n", "<leader>gp", gs.preview_hunk_inline, { desc = "Preview hunk" })
				map("n", "<leader>gt", gs.toggle_deleted, { desc = "Toggle deleted" })
				map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset Hunk" })
				map("n", "]h", gs.next_hunk, { desc = "Next Hunk" })
				map("n", "[h", gs.prev_hunk, { desc = "Prev Hunk" })
				map("v", "<leader>gr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset hunk" })
				map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
				map("n", "<leader>gd", gs.diffthis, { desc = "Diff entire buffer" })
			end,
		},
	},
}
