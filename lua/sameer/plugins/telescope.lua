return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, {})
		vim.keymap.set("n", "<leader>f", builtin.current_buffer_fuzzy_find, {})
		vim.keymap.set("n", "<leader>F", builtin.live_grep, {})
	end,
}
