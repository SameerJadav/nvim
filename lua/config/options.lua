local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.cindent = true
opt.autoindent = true
opt.breakindent = true

opt.smartcase = true
opt.ignorecase = true
opt.incsearch = true
opt.hlsearch = true

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes:1"
opt.termguicolors = true
opt.showmode = false
opt.wrap = false
opt.scrolloff = 10
opt.colorcolumn = "80"

opt.splitbelow = true
opt.splitright = true
opt.inccommand = "split"

opt.more = false
opt.updatetime = 50
opt.undofile = true
opt.shada = { "'10", "<0", "s10", "h" }

vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

vim.diagnostic.config({
	underline = false,
	virtual_text = true,
	severity_sort = true,
	signs = false,
})
