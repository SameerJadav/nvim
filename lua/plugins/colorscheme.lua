return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			terminal_colors = true,
		})
		vim.cmd.colorschem("tokyonight-night")
	end,
}
