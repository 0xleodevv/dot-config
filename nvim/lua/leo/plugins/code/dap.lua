return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"nvim-neotest/nvim-nio",
	},
	keys = {
        --stylua: ignore
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        --stylua: ignore
        { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
        --stylua: ignore
        { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
        --stylua: ignore
        { "<leader>dT", function() require("dap").terminate() end, desc = "Terminate" },
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		require("dap-go").setup()
		require("dapui").setup()

		local sign = vim.fn.sign_define
		sign("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
