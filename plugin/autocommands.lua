vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("custom-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "gitcommit" },
	group = vim.api.nvim_create_augroup("custom-spell-checking", { clear = true }),
	callback = function()
		vim.o.spell = true
		vim.o.spelllang = "en_us"
		vim.o.spelloptions = "camel"
	end,
})
