return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", "<Cmd>tab Git<CR>")
		vim.keymap.set("n", "<leader>gc", "<Cmd>Git commit<CR>")
		vim.keymap.set("n", "<leader>gp", "<Cmd>Git push<CR>")
		vim.keymap.set("n", "<leader>gl", "<Cmd>tab Git log --oneline --decorate --graph<CR>")
	end,
}
