return {
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	{
		"esmuellert/codediff.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		cmd = "CodeDiff",
		opts = {
			highlights = {
				line_insert = "#20281C",
				line_delete = "#281C22",
				-- char_insert = "#3fb950",
				-- char_delete = "#ff7b72",
			},
		},
       -- stylua: ignore
        keys = {
            { "<leader>gd",":CodeDiff file HEAD<CR>", desc = "Diff entire buffer" },
        }
,
	},
	-- {
	-- 	"lewis6991/gitsigns.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	opts = {
	-- 		on_attach = function(bufnr)
	-- 			local gs = package.loaded.gitsigns
	-- 			local function map(mode, l, r, opts)
	-- 				opts = opts or {}
	-- 				opts.buffer = bufnr
	-- 				vim.keymap.set(mode, l, r, opts)
	-- 			end
	-- 			map("n", "<leader>gp", gs.preview_hunk_inline, { desc = "Preview hunk" })
	-- 			map("n", "<leader>gt", gs.toggle_deleted, { desc = "Toggle deleted" })
	-- 			map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset Hunk" })
	-- 			-- map("n", "]h", gs.next_hunk, { desc = "Next Hunk" })
	-- 			-- map("n", "[h", gs.prev_hunk, { desc = "Prev Hunk" })
	-- 			map("v", "<leader>gr", function()
	-- 				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
	-- 			end, { desc = "Reset hunk" })
	-- 			map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
	-- 			map("n", "<leader>gd", gs.diffthis, { desc = "Diff entire buffer" })
	-- 		end,
	-- 	},
	-- },
	{
		"echasnovski/mini.diff",
		event = { "BufReadPre", "BufNewFile" },
		opts = {

			view = {
				style = "sign",
				signs = { add = "▎", change = "▎", delete = "" },
			},
			mappings = {
				apply = "gh",
				reset = "<leader>gr",
				textobject = "gh",
				goto_first = "[H",
				goto_prev = "[h",
				goto_next = "]h",
				goto_last = "]H",
			},
			options = {
				wrap_goto = true,
			},
		},
        --stylua: ignore
		keys = {
			{ "<leader>gt", function() MiniDiff.toggle_overlay(0) end, desc = "Toggle diff overlay" },
			{ "<leader>gr", function() MiniDiff.operator("reset") end, desc = "Reset hunk (operator)" },
			{ "<leader>gR", function() MiniDiff.do_hunks(0, 'reset', { line_start = 1, line_end = vim.fn.line('$') }) end, desc = "Reset buffer" },
		},
	},
}
