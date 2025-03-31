return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } },
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			vim.o.statusline = " "
		else
			vim.o.laststatus = 0
		end
	end,
	config = function()
		local theme = {}

		local modes = {
			"normal",
			"insert",
			"visual",
			"replace",
			"command",
			"inactive",
			"terminal",
		}

		for _, mode in ipairs(modes) do
			theme[mode] = {
				a = { bg = "#eeeeee", fg = "#111111", gui = "bold" },
				b = { bg = "#222222", fg = "#eeeeee" },
				c = { bg = "#191919", fg = "#eeeeee" },
			}
		end

		require("lualine").setup({
			options = {
				theme = theme,
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "filename" },
				lualine_c = { "diagnostics" },
				lualine_x = { "" },
				lualine_y = { "diff" },
				lualine_z = { { "branch", icons_enabled = false } },
			},
		})
	end,
}
