-- [[ plugins.lua ]]

-- Packer Installation Function
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        print("Installing packer close and reopen Neovim...")
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
local status, packer = pcall(require, "packer")
if (not status) then return end

packer.init({
    git = {
        clone_timeout = 120, -- timeout, in seconds, for git clones
    },
    display = {
        open_fn = require('packer.util').float,
    },
})

-- Packer.nvim {{{
packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'onsails/lspkind-nvim'
    use 'MunifTanjim/prettier.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        -- run = ':TSUpdate',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-tree/nvim-web-devicons'},
        }
    }
    use {
        'nvim-telescope/telescope-file-browser.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope.nvim'},
        }
    }
    use {
        'xiyaowong/telescope-emoji.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope.nvim'},
        }
    }

    -- Filer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-emoji'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    -- AI
    -- use 'codota/tabnine-vim'
    use {
        'tzachar/cmp-tabnine',
        run = './install.sh', requires = 'hrsh7th/nvim-cmp'
    }
    -- use 'github/copilot.vim'
    use 'hrsh7th/cmp-copilot'

    -- Autopairs
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup({}) end,
    }
    -- Indent Visualization
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() end,
    }

    -- Statusline
    use 'kyazdani42/nvim-web-devicons'
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
    }

    -- Tabline
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
    }

    -- Colorscheme
    use 'dracula/vim'
    use 'folke/tokyonight.nvim'
    use 'sainnhe/everforest'
    use 'morhetz/gruvbox'
    use 'sonph/onehalf'
    use 'sainnhe/gruvbox-material'
    use 'sainnhe/sonokai'
    use 'joshdick/onedark.vim'
    use 'arcticicestudio/nord-vim'
    use 'tomasr/molokai'
    use 'junegunn/seoul256.vim'
    use 'cocopon/iceberg.vim'

    if packer_bootstrap then
        packer.sync()
    end
end)
-- }}}

require('plugins.statusline')
require('plugins.lsp')
require('plugins.completion')
require('plugins.colorscheme')
require('plugins.editor')
require('plugins.syntax')
require('plugins.filer')
require('plugins.telescope')

