local install_path = vim.fn.stdpath 'data' ..
                         '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system {
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    }
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use "rebelot/kanagawa.nvim"

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update {with_sync = true})
        end
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'windwp/nvim-ts-autotag'

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        }
    }

    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim',
            'j-hui/fidget.nvim', 'folke/neodev.nvim',
            'jose-elias-alvarez/null-ls.nvim'
        }
    }

    use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable 'make' == 1
    }
    use {"nvim-telescope/telescope-file-browser.nvim"}

    use 'ThePrimeagen/harpoon'

    use 'nvim-lualine/lualine.nvim'
    use 'stevearc/dressing.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'tpope/vim-sleuth'
    use 'andweeb/presence.nvim'
    use 'mbbill/undotree'

    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'

    use 'lewis6991/impatient.nvim'
    use 'ThePrimeagen/vim-be-good'

    use 'numToStr/Comment.nvim'
    use 'echasnovski/mini.ai'
    use 'echasnovski/mini.pairs'
    use 'echasnovski/mini.surround'

end)
