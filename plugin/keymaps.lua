local set = vim.keymap.set

set("n", "<C-C>", "<Cmd>nohlsearch<CR>")
set("i", "<C-C>", "<Esc>")

set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "J", "mzJ`z")

set("n", "<leader>p", '"+p')
set("n", "<leader>P", '"+P')
set("v", "<leader>p", '"+p')

set("n", "<C-D>", "<C-D>zz")
set("n", "<C-U>", "<C-U>zz")

set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<C-J>", "<C-W><C-J>")
set("n", "<C-K>", "<C-W><C-K>")
set("n", "<C-L>", "<C-W><C-L>")
set("n", "<C-H>", "<C-W><C-H>")

set("n", "<leader>nt", "<Cmd>tabnew<CR>")
set("n", "H", "<Cmd>tabnext<CR>")
set("n", "L", "<Cmd>tabprevious<CR>")

set("n", "<leader>vs", "<Cmd>vsplit<CR>")
set("n", "<leader>hs", "<Cmd>split<CR>")
set("n", "<C-Up>", "<Cmd>resize -2<CR>")
set("n", "<C-Down>", "<Cmd>resize +2<CR>")
set("n", "<C-Left>", "<Cmd>vertical resize +2<CR>")
set("n", "<C-Right>", "<Cmd>vertical resize -2<CR>")

set("n", "[d", vim.diagnostic.goto_prev)
set("n", "]d", vim.diagnostic.goto_next)

set("n", "<leader>s", [[:%s/<C-R><C-W>/<C-R><C-W>/g<Left><Left>]])
set("n", "<leader>sc", [[:%s/<C-R><C-W>/<C-R><C-W>/gc<Left><Left><Left>]])

set("n", "<leader>w", "<Cmd>silent update<CR>", { silent = true })
set("n", "<leader>q", "<Cmd>silent quit<CR>", { silent = true })
set("n", "<leader>x", "<Cmd>wq<CR>", { silent = true })

set("n", "<C-F>", "<Cmd>silent !tmux neww tmux-sessionizer<CR>")
