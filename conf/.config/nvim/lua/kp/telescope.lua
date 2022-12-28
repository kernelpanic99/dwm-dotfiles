local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})

vim.keymap.set('n', '<Leader>ls', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<Leader>lS', builtin.lsp_workspace_symbols, {})

vim.keymap.set('n', '<Leader>j', builtin.jumplist, {})

require('telescope').setup({
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    }
})
