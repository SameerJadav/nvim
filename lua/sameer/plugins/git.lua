return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>g", vim.cmd.Git)

		vim.api.nvim_create_autocmd("BufWinEnter", {
			group = vim.api.nvim_create_augroup("sameer_fugitive", { clear = true }),
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				local opts = { buffer = bufnr }
				vim.keymap.set("n", "<leader>gp", function()
					vim.cmd.Git("push")
				end, opts)

				vim.keymap.set("n", "<leader>gP", function()
					vim.cmd.Git({ "pull", "--rebase" })
				end, opts)

				vim.keymap.set("n", "<leader>t", ":Git push -u origin", opts)
			end,
		})
	end,
}
