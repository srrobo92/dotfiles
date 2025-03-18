
-- Set up Lazy
require("config.lazy")

-- Basic setup
require("usermod.settings")
require("usermod.remaps")

-- Setup Theme
vim.cmd[[colorscheme eldritch]]

-- LSP enables
vim.lsp.enable('verible_lsp')
vim.lsp.enable('vhdl_lsp')
vim.lsp.enable('bash')
vim.lsp.enable('pyls')
