-- Global variables
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.showmode = false

-- Editing
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.breakindent = true

-- Others
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.scrolloff = 10
opt.inccommand = "split"
opt.updatetime = 50
