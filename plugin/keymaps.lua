local set = vim.keymap.set

-- General
set("n", "<c-c>", "<cmd>nohlsearch<cR>")
set("i", "<c-c>", "<Esc>")

-- Editing
set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set("v", "J", ":m '>+1<cr>gv=gv")
set("v", "K", ":m '<-2<cr>gv=gv")
set("n", "J", "mzJ`z")

-- Navigation
set("n", "<c-d>", "<c-d>zz")
set("n", "<c-u>", "<c-u>zz")
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
set("n", "<leader>s", [[:%s/<c-r><c-w>/<c-r><c-w>/g<Left><Left>]])
set("n", "<leader>sc", [[:%s/<c-r><c-w>/<c-r><c-w>/gc<Left><Left><Left>]])

-- Buffers
set("n", "<leader>w", "<cmd>silent update<cr>", { silent = true })
set("n", "<leader>q", "<cmd>silent quit<cr>", { silent = true })
set("n", "<leader>x", "<cmd>wq<cr>", { silent = true })

-- Terminal
set("n", "<c-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")

set("n", "<space>th", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end)
