vim.keymap.set('n', '<Leader>ps', ':PackerSync<cr>')

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Colorschemes
    use 'catppuccin/nvim'
    use 'rose-pine/neovim'
    use 'morhetz/gruvbox'
    use 'EdenEast/nightfox.nvim'
    use 'folke/tokyonight.nvim'
    use 'pineapplegiant/spaceduck'
    use 'sainnhe/everforest'
    use 'phha/zenburn.nvim'

    use {
        "mcchrish/zenbones.nvim",
        requires = "rktjmp/lush.nvim"
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use 'johann2357/nvim-smartbufs'
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    use 'tjdevries/express_line.nvim'
    use 'RRethy/vim-illuminate'
    use 'windwp/nvim-ts-autotag'
    -- use 'm4xshen/autoclose.nvim'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use "lukas-reineke/indent-blankline.nvim"
    use 'kdheepak/lazygit.nvim'
    use { "akinsho/toggleterm.nvim", tag = '*' }
    use 'jose-elias-alvarez/null-ls.nvim'

    use({
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    })
    use {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    }
    use 'lewis6991/gitsigns.nvim'
    use 'mbbill/undotree'
end)
