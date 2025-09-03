
-- Set up Lazy
require("config.lazy")
vim.api.nvim_create_autocmd("VimEnter",{callback=function()require"lazy".update({show = false})end})

-- Basic setup
require("usermod.settings")
require("usermod.remaps")

-- Setup Theme
vim.cmd[[colorscheme eldritch]]

-- LSP enables
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('*', {
    capabilities = capabilities
})
vim.lsp.enable('verible_lsp')
vim.lsp.enable('vhdl_lsp')
vim.lsp.enable('bash')
vim.lsp.enable('pyls')
