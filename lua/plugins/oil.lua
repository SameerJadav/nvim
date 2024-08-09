return {
	"stevearc/oil.nvim",
	dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } },
	config = function()
		require("oil").setup({
			columns = { "icon" },
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "<leader>e", "<Cmd>Oil<CR>")
	end,
}
