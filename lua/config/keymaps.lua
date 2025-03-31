local map = require("utils").map

map("n", "<leader>e", "<Cmd>e .<CR>")

map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-D>", "<C-D>zz")
map("n", "<C-U>", "<C-U>zz")

map("v", ">", ">gv")
map("v", "<", "<gv")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<Esc>", "<Cmd>nohlsearch<CR>")

map("n", "J", "mzJ`z")

map("n", "<leader>s", [[:%s/<C-R><C-W>//g<Left><Left>]])
map("n", "<leader>sc", [[:%s/<C-R><C-W>//gc<Left><Left><Left>]])

map("n", "<leader>w", "<Cmd>update<CR>")
map("n", "<leader>q", "<Cmd>quit<CR>")
map("n", "<leader>x", "<Cmd>wq<CR>")

map("n", "<leader>yf", "ggVGy")
map("n", "<leader>cf", "ggVGc")

map("i", "<c-space>", function()
	vim.lsp.completion.get()
end)

map("n", "<leader>hc", function()
	local current_value = vim.o.colorcolumn
	if current_value == "80" then
		vim.o.colorcolumn = ""
	else
		vim.o.colorcolumn = "80"
	end
end)

map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)

map("n", "<C-F>", "<Cmd>silent !tmux neww tmux-sessionizer<CR>")
