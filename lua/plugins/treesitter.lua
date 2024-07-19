return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = "VeryLazy",
	lazy = vim.fn.argc(-1) == 0,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	config = function()
		require("nvim-treesitter.install").prefer_git = true
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline", "query" },
			sync_install = false,
			auto_install = vim.fn.executable("tree-sitter") > 0,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
