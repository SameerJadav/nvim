vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

local o = vim.o

o.number = true
o.relativenumber = true
o.wrap = false
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.termguicolors = true
o.showmode = false

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.breakindent = true

o.clipboard = "unnamedplus"
o.undofile = true
o.scrolloff = 10
o.inccommand = "split"
o.updatetime = 50
o.splitright = true

vim.diagnostic.config({
	underline = true,
	severity_sort = true,
	update_in_insert = false,
	virtual_text = { source = "if_many", prefix = "󰝤", spacing = 4 },
})
