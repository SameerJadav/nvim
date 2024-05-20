return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = { use_diagnostic_signs = true },
	config = function()
		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").toggle()
		end)
	end,
}
