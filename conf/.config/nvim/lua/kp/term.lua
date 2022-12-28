require('toggleterm').setup()

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set({ 'n', 't' }, '<C-t>', '<C-\\><C-n>:ToggleTerm<cr>')
