-- Leader key
vim.g.mapleader = ' '

-- Default encoding
vim.g.encoding='UTF-8'

-- show numbers
vim.opt.number = true

-- show relative numbers
vim.opt.relativenumber = false

-- show matching parenthesis
vim.o.showmatch = true

-- ignore case in vim commands
vim.o.ignorecase = true

-- transform tabs into spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- I trust you to be smarter and indent nicely
vim.opt.smartindent = true

-- no wrap line
vim.opt.wrap = true

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.o.undofile = true
vim.g.undodir = '/tmp'

-- search highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- fast updatetime
vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.opt.clipboard = "unnamedplus"

vim.cmd([[
:set noshowmode
]])
