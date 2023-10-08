local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- appearance
opt.cursorline = true
opt.termguicolors = true

-- indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true

opt.smartindent = true

opt.clipboard = "unnamedplus"

-- line numbers
opt.number = true
opt.relativenumber = true

opt.textwidth = 72
opt.wrap = true

opt.swapfile = false
opt.backup = false

-- long running undos
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

--split windows
opt.splitright = true
opt.splitbelow = true

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.iskeyword:append("-")
