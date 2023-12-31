local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- appearance
opt.cmdheight = 0
opt.cursorline = true
opt.numberwidth = 3
opt.termguicolors = true

-- indentation
opt.expandtab = true
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.tabstop = 4
opt.smartindent = true

-- sync clipboard between OS and Neovim.
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

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"

-- set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

opt.iskeyword:append("-")

opt.updatetime = 50
