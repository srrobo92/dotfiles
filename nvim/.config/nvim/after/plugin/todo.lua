vim.keymap.set("n", '<leader>dn', function() require("todo-comments").jump_next() end, { desc = "Next todo"})
vim.keymap.set("n", '<leader>dp', function() require("todo-comments").jump_prev() end, { desc = "Prev todo"})
