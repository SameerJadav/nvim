return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		icons_enabled = true,
		theme = "tokyonight",
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "diff" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		section_separators = "",
		component_separators = "",
	},
}
