return {
	"folke/tokyonight.nvim",
	config = function()
		vim.cmd.colorschem("tokyonight-night")
		require("tokyonight").setup({
			style = "night",
		})
	end,
}
