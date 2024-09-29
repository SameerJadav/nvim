local map = require("utils").map

map("n", "<C-C>", "<Cmd>nohlsearch<CR>")
map("i", "<C-C>", "<Esc>")

map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("v", ">", ">gv")
map("v", "<", "<gv")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")

map("n", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')
map("v", "<leader>p", '"+p')

map("n", "<C-D>", "<C-D>zz")
map("n", "<C-U>", "<C-U>zz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")

map("n", "<leader>nt", "<Cmd>tabnew<CR>")
map("n", "L", "<Cmd>tabnext<CR>")
map("n", "H", "<Cmd>tabprevious<CR>")

map("n", "<leader>vs", "<Cmd>vsplit<CR>")
map("n", "<leader>hs", "<Cmd>split<CR>")
map("n", "<C-Up>", "<Cmd>resize -2<CR>")
map("n", "<C-Down>", "<Cmd>resize +2<CR>")
map("n", "<C-Left>", "<Cmd>vertical resize +2<CR>")
map("n", "<C-Right>", "<Cmd>vertical resize -2<CR>")

map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)

map("n", "<leader>s", [[:%s/<C-R><C-W>/<C-R><C-W>/g<Left><Left>]])
map("n", "<leader>sc", [[:%s/<C-R><C-W>/<C-R><C-W>/gc<Left><Left><Left>]])

map("n", "<leader>w", "<Cmd>update<CR>")
map("n", "<leader>q", "<Cmd>quit<CR>")
map("n", "<leader>x", "<Cmd>wq<CR>")

map("n", "<leader>hc", function()
	local current_value = vim.o.colorcolumn
	if current_value == "80" then
		vim.o.colorcolumn = ""
	else
		vim.o.colorcolumn = "80"
	end
end)

map("n", "<C-F>", "<Cmd>silent !tmux neww tmux-sessionizer<CR>")
