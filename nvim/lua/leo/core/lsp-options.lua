vim.diagnostic.config({ virtual_text = false })

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

local keymap = vim.keymap

keymap.set("n", "Q", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "open floating diagnostics" })

keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })

keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })

keymap.set("n", "K", function()
	vim.lsp.buf.hover({
		border = "rounded",
	})
end, { desc = "Show documentation for what is under cursor" })

keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })

vim.g["diagnostics_active"] = true
function Toggle_diagnostics()
	if vim.g.diagnostics_active then
		vim.g.diagnostics_active = false
		vim.diagnostic.enable(false)
	else
		vim.g.diagnostics_active = true
		vim.diagnostic.enable()
	end
end

vim.keymap.set(
	"n",
	"<leader>xd",
	Toggle_diagnostics,
	{ noremap = true, silent = true, desc = "Toggle vim diagnostics" }
)
