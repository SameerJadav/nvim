return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("telescope").setup()
		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>gs", builtin.grep_string, {})
		vim.keymap.set("n", "<leader>df", builtin.current_buffer_fuzzy_find, {})
		vim.keymap.set("n", "<leader>wf", builtin.live_grep, {})
	end,
}
