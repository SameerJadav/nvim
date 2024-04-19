return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = { style = "night", transparent = true },
	init = function()
		vim.cmd.colorschem("tokyonight-night")
		vim.cmd.hi("Comment gui=none")
	end,
}
