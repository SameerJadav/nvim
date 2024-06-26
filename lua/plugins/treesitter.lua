return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		opts = {},
		config = function()
			vim.keymap.set("n", "[c", function()
				require("treesitter-context").go_to_context(vim.v.count1)
			end, { silent = true })
		end,
	},
	version = false,
	build = ":TSUpdate",
	event = "VeryLazy",
	lazy = vim.fn.argc(-1) == 0,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
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
			auto_install = vim.fn.executable("tree-sitter") > 0,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
