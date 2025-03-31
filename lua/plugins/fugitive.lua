return {
	"tpope/vim-fugitive",
	config = function()
		local map = require("utils").map
		map("n", "<leader>gs", "<Cmd>Git<CR>")
		map("n", "<leader>gc", "<Cmd>Git commit<CR>")
		map("n", "<leader>gp", "<Cmd>Git push<CR>")
		map("n", "<leader>gl", "<Cmd>Git log --oneline --decorate --graph<CR>")
	end,
}
