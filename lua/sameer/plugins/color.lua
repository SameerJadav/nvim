return {
	"olimorris/onedarkpro.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd.colorschem("onedark_dark")
	end,
	opts = {
		options = {
			transparency = true,
			cursorline = true,
		},
	},
}
