local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>ca", function()
	vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "Q", function()
	vim.cmd.RustLsp({ "renderDiagnostic", "current" })
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>dr", function()
	vim.cmd.RustLsp("debuggables")
end, { desc = "Rust Debuggables", buffer = bufnr })
