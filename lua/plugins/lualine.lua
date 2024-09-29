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
		require("lualine").setup({
			icons_enabled = true,
			theme = "auto",
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "filename" },
				lualine_c = { "diagnostics" },
				lualine_x = { "diff" },
				lualine_y = { "branch" },
				lualine_z = { "location" },
			},
		})
	end,
}
