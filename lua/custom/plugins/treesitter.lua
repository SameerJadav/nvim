return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.install").prefer_git = true
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"go",
				"gomod",
				"gosum",
				"javascript",
				"typescript",
				"bash",
				"lua",
				"luadoc",
				"vim",
				"vimdoc",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
