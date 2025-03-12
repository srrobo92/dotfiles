-- Disable word wrap
vim.opt.wrap = false

-- Disable compatibility to old-time vi
vim.opt.compatible = false

-- Show matching parentheses
vim.opt.showmatch = true

-- Case insensitive searching
vim.opt.ignorecase = true

-- Enable mouse support
vim.opt.mouse = 'a'

-- Highlight search results
vim.opt.hlsearch = true

-- Incremental search
vim.opt.incsearch = true

-- Set tab width
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Auto indent new lines
vim.opt.autoindent = true

-- Show line numbers
vim.opt.relativenumber = true

-- Bash-like tab completions
vim.opt.wildmode = { 'longest', 'list' }

-- Enable file type detection and plugins
vim.cmd('filetype plugin indent on')

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Enable mouse support
vim.opt.mouse = 'a'

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Highlight current cursor line
vim.opt.cursorline = true

-- Speed up scrolling in Vim
vim.opt.ttyfast = true

-- termguicolors
vim.opt.termguicolors = true

-- Uncomment the following lines if needed
-- Enable spell check (may need to download language package)
-- vim.opt.spell = true

-- Disable creating swap file
-- vim.opt.swapfile = false

-- Directory to store backup files
-- vim.opt.backupdir = vim.fn.expand('~/.cache/vim')i
