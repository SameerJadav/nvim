return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } },
	config = function()
		vim.keymap.set("n", "<C-p>", function()
			require("trouble").toggle()
		end)
	end,
}
