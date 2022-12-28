vim.g.mapleader = ' '

vim.keymap.set('n', '<Leader>e', vim.cmd.Vexplore)

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-j>', '<C-w>j')

-- Center cursor when scrolling

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', '<Leader>a', ':CodeActionMenu<cr>')

vim.keymap.set('n', '<Leader>u', ':UndotreeToggle<cr>')


