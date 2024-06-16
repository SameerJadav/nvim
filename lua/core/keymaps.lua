local set = vim.keymap.set

-- General
set("n", "<C-c>", "<cmd>nohlsearch<CR>")
set("i", "<C-c>", "<Esc>")

-- Editing
set("i", "<C-H>", "<C-W>")
set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set("v", "J", ":m '>+1<cr>gv=gv")
set("v", "K", ":m '<-2<cr>gv=gv")
set("n", "J", "mzJ`z")

-- Navigation
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

-- Diagnostics
set("n", "[d", vim.diagnostic.goto_prev)
set("n", "]d", vim.diagnostic.goto_next)

-- Search and Replace
set("n", "<leader>s", [[:%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>]])
set("n", "<leader>sc", [[:%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>]])

-- Buffers
set("n", "<leader>w", "<cmd>w<cr>", { silent = true })
set("n", "<leader>q", "<cmd>q<cr>", { silent = true })
set("n", "<leader>x", "<cmd>wq<cr>", { silent = true })

-- Terminal
set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
set("n", "<leader>t", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 12)
	vim.wo.winfixheight = true
	vim.cmd.startinsert()
	vim.cmd.term()
end)
set("t", "<C-d>", "<C-\\><C-n><cmd>q<cr>")
