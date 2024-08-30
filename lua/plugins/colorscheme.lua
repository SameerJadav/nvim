return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({ lualine_bold = true })
		vim.cmd("colorscheme tokyonight-night")
	end,
}
-- return {
-- 	"navarasu/onedark.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("onedark").setup({
-- 			style = "darker",
-- 			colors = {
-- 				bg0 = "#111111",
-- 				bg1 = "#191919",
-- 				bg2 = "#222222",
-- 				bg3 = "#2A2A2A",
-- 			},
-- 			diagnostics = {
-- 				darker = false,
-- 				undercurl = false,
-- 				background = false,
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("onedark")
-- 	end,
-- }
