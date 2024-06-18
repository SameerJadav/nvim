return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>g", "<cmd>enew<cr><cmd>Git<cr><c-w><c-j><cmd>q<cr>")
		vim.api.nvim_create_autocmd("BufWinEnter", {
			group = vim.api.nvim_create_augroup("custom-fugitive", { clear = true }),
			pattern = "fugitive://*",
			callback = function()
				local bufnr = vim.api.nvim_get_current_buf()

				local map = function(keys, func)
					vim.keymap.set("n", keys, func, { buffer = bufnr })
				end

				map("<leader>gc", "<cmd>Git commit<cr>")
				map("<leader>gp", "<cmd>Git push<cr>")
				map("<leader>gl", "<cmd>Git log --oneline --decorate --graph<cr>")
			end,
		})
	end,
}
