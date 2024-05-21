return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			icons_enabled = true,
			theme = "auto",
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "diff" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		})
	end,
}
