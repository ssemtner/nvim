-- set <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Highlight on search
vim.o.hlsearch = false

-- Enable line numbers
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching unless capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to be better
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true
