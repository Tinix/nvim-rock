local opt = vim.opt

opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.completeopt = "menuone,noinsert,noselect"

opt.number = true
opt.relativenumber = false
opt.showmatch = true
opt.foldmethod = "marker"
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.linebreak = true
opt.termguicolors = true
opt.signcolumn = "yes"

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.wrap = false

opt.incsearch = true
opt.hlsearch = true

opt.updatetime = 250
opt.timeoutlen = 500

opt.undofile = true
opt.undodir = vim.fn.expand("~/.config/nvim/undo")
opt.backup = false
opt.writebackup = false

vim.fn.mkdir(vim.fn.expand("~/.config/nvim/undo"), "p")
