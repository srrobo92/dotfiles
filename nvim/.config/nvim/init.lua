
-- Set up Lazy
require("config.lazy")

-- Basic setup
require("usermod.settings")
require("usermod.remaps")

-- Setup Theme
vim.cmd[[colorscheme eldritch]]

-- LSPs?
require'lspconfig'.verible.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    root_dir = function() return vim.uv.cwd() end
}
require'lspconfig'.vhdl_ls.setup{}
