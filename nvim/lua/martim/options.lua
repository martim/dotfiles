-- Leader Keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Highlight Search
vim.o.hlsearch = false
vim.opt.incsearch = true

-- Relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.signcolumn = "yes"

-- Mouse enabled
vim.o.mouse = 'a'

-- Break Indent
vim.o.breakindent = true

-- Undo History
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.swapfile = false
vim.opt.backup = false

-- Case insensitive
vim.o.ignorecase = true
vim.o.smartcase = true

-- Update time
vim.o.updatetime = 250

-- Term GUI colors
vim.o.termguicolors = true

-- Netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Clipboard
vim.opt.clipboard = 'unnamedplus'

-- Wrapping
vim.opt.wrap = true

-- Scrolling
vim.opt.scrolloff = 8

-- Completion
vim.opt.completeopt = 'menuone,noselect'

-- Popup
vim.opt.pumblend = 10
vim.opt.pumheight = 10

-- Names
vim.opt.isfname:append("@-@")

-- Cursor
vim.opt.cursorline = false
