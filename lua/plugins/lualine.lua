return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } },
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
