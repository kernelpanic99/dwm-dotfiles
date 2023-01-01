vim.opt.signcolumn = 'yes'

local lsp = require('lsp-zero')

lsp.set_preferences({
    suggest_lsp_servers = false,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
    sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = ''
    }
})

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'gopls',
    'clangd',
    'rust_analyzer',
})

lsp.nvim_workspace()

lsp.setup()

vim.keymap.set('n', '<Leader>lf', ':LspZeroFormat<cr>')
