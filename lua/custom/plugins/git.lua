return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>g", vim.cmd.Git)
		vim.api.nvim_create_autocmd("BufWinEnter", {
			group = vim.api.nvim_create_augroup("SameerFugitive", { clear = true }),
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end
				local bufnr = vim.api.nvim_get_current_buf()
				local map = function(keys, func)
					vim.keymap.set("n", keys, func, { buffer = bufnr })
				end

				map("<leader>gc", function()
					vim.cmd.Git("commit")
				end)
				map("<leader>gp", function()
					vim.cmd.Git("push")
				end)
			end,
		})
	end,
}
