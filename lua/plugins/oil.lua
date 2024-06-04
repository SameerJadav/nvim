return {
	"stevearc/oil.nvim",
	dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } },
	config = function()
		require("oil").setup({
			columns = { "icon" },
			view_options = {
				show_hidden = true,
			},
		})

		vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")
	end,
}
