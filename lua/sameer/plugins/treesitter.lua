return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
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
		auto_install = true,
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.install").prefer_git = true
		require("nvim-treesitter.configs").setup(opts)
	end,
}
