local bufs = require('nvim-smartbufs')

vim.keymap.set('n', '<A-1>', function () bufs.goto_buffer(1) end)
vim.keymap.set('n', '<A-2>', function () bufs.goto_buffer(2) end)
vim.keymap.set('n', '<A-3>', function () bufs.goto_buffer(3) end)
vim.keymap.set('n', '<A-4>', function () bufs.goto_buffer(4) end)
vim.keymap.set('n', '<A-5>', function () bufs.goto_buffer(5) end)
vim.keymap.set('n', '<A-6>', function () bufs.goto_buffer(6) end)
vim.keymap.set('n', '<A-7>', function () bufs.goto_buffer(7) end)
vim.keymap.set('n', '<A-8>', function () bufs.goto_buffer(8) end)
vim.keymap.set('n', '<A-9>', function () bufs.goto_buffer(9) end)

vim.keymap.set('n', '<Leader>c', function () bufs.close_current_buffer() end)

vim.keymap.set('n', '<Leader>t1', function () bufs.goto_terminal(1) end)
vim.keymap.set('n', '<Leader>t2', function () bufs.goto_terminal(2) end)

