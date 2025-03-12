return {
    'neovim/nvim-lspconfig',
    config = function ()
        local lspconfig = require('lspconfig')
        local util = require 'lspconfig.util'

        local root_files = {
            'vhdl_ls.toml',
            '.vhdl_ls.toml',
        }

        -- Versible LSP config
        lspconfig.verible.setup{
            cmd = { "verible-verilog-ls" },
            filetypes = { "systemverilog", "verilog" },
            root_dir = function(fname)
                return lspconfig.util.root_pattern(".git")(fname) or vim.fn.getcwd()
            end,
            on_attach = function(client, bufnr)
                -- Your on_attach function here
            end,
            flags = {
                -- Your lsp_flags here
            },
            settings = {},
            docs = {
                description = [[
                https://github.com/chipsalliance/verible

                A linter and formatter for Verilog and SystemVerilog files.

                Release binaries can be downloaded from [here](https://github.com/chipsalliance/verible/releases)
                and placed in a directory on PATH.

                See https://github.com/chipsalliance/verible/tree/master/verilog/tools/ls/README.md for options.
                ]]
            }
        }
        -- VHDL LSP config
        lspconfig.vhdl_ls.setup{
            cmd = { "vhdl_ls" },
            filetypes = { "vhdl", "vhd" },
            root_dir = util.root_pattern(unpack(root_files)),
            signle_file_support =true,
            on_attach = function(client, bufnr)
                -- Your on_attach function here
            end,
            flags = {
                -- Your lsp_flags here
            },
            settings = {}
        }

    end
}
