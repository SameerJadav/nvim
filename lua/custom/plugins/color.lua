return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorschem("tokyonight-night")
		require("tokyonight").setup({
			style = "night",
		})
	end,
}
