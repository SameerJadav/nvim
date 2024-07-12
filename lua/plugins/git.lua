return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", "<cmd>tab Git<cr>")
		vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>")
		vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>")
		vim.keymap.set("n", "<leader>gl", "<cmd>tab Git log --oneline --decorate --graph<cr>")
	end,
}
