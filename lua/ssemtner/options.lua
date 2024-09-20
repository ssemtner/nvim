-- set <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- Highlight on search
vim.opt.hlsearch = false

-- Enable line numbers
vim.opt.number = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching unless capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Set completeopt to be better
vim.opt.completeopt = 'menuone,noselect'

vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Keep lines around cursor
vim.opt.scrolloff = 10

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
