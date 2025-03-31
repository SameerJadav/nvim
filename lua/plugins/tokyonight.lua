return {
	"folke/tokyonight.nvim",
	lazy = false,
	config = function()
		require("tokyonight").setup({
			style = "night",
			on_colors = function(colors)
				colors.bg = "#111111"
				colors.bg_float = "#222222"
				colors.bg_popup = "#222222"
				colors.bg_visual = "#313131"
				colors.fg_gutter = "#313131"
			end,
			on_highlights = function(highlights)
				local colors = require("tokyonight.colors").setup()
				highlights.ColorColumn = { bg = "#191919" }
				highlights.TabLine = { bg = "#222222" }
				highlights.TabLineFill = { bg = "#191919" }
				highlights.TabLineSel = { bg = "#313131" }
				highlights.DiagnosticVirtualTextError = { bg = "NONE", fg = colors.error }
				highlights.DiagnosticVirtualTextWarn = { bg = "NONE", fg = colors.warning }
				highlights.DiagnosticVirtualTextInfo = { bg = "NONE", fg = colors.info }
				highlights.DiagnosticVirtualTextHint = { bg = "NONE", fg = colors.hint }
			end,
		})
		vim.cmd("colorscheme tokyonight-night")
	end,
}
