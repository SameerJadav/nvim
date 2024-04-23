return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd.colorschem("tokyonight-night")
	end,
	opts = {
		style = "night",
		transparent = true,
	},
}
