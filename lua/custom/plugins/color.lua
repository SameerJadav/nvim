return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			styles = {
				comments = {},
				keywords = {},
				functions = {},
				variables = {},
				sidebars = "dark",
				floats = "dark",
			},
		})
		vim.cmd.colorschem("tokyonight-night")
	end,
}
