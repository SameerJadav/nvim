vim.g.have_nerd_font = true
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

local opt = vim.opt

opt.clipboard = "unnamedplus"

opt.number = true
opt.relativenumber = true

opt.wrap = false

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.breakindent = true

opt.scrolloff = 10

opt.signcolumn = "yes"

opt.undofile = true

opt.inccommand = "split"

opt.cursorline = true
opt.termguicolors = true

opt.updatetime = 250

opt.showmode = false
