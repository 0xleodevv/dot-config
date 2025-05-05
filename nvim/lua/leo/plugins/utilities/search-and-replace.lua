return {
	"MagicDuck/grug-far.nvim",
	opts = { headerMaxWidth = 80 },
	cmd = "GrugFar",
	config = function()
		require("grug-far").setup({
			windowCreationCommand = "split",
		})
	end,
}
