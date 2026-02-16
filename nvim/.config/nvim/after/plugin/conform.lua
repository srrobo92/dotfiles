local conform = require("conform")
conform.setup({
    formatters_by_ft = {
        verilog = {'verible'},
        systemverilog = {'verible'},
    },
    formatters = {
        verible = {
            command = '/home/sra0812/.local/bin/verible/bin/verible-verilog-format',
            args = {"-"},
            stdin = true,
        },
    },
})

vim.keymap.set('n', '<leader>f', function() conform.format() end)
