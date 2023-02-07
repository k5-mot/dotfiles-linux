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
    -- use {
    --     "glepnir/lspsaga.nvim",
    --     branch = "main",
    --     config = function()
    --         local saga = require("lspsaga")

    --         saga.init_lsp_saga({
    --             -- your configuration
    --         })
    --     end,
    -- }

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
    use {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require("telescope").load_extension("frecency")
        end,
        requires = {
            {"kkharji/sqlite.lua"},
            {'nvim-telescope/telescope.nvim'},
        }
    }
    use {
        "nvim-telescope/telescope-packer.nvim",
        config = function()
            require("telescope").load_extension("packer")
        end,
        requires = {
            {'nvim-telescope/telescope-file-browser.nvim'},
            {'nvim-telescope/telescope.nvim'},
        }
    }
    -- use {
    --     "nvim-telescope/telescope-symbols.nvim",
    --     config = function()
    --         require("telescope").load_extension("symbols")
    --     end,
    --     requires = {
    --         {'nvim-telescope/telescope.nvim'},
    --     }
    -- }

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
    use 'hrsh7th/cmp-nvim-lsp-document-symbol'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'ray-x/cmp-treesitter'
    -- AI
    -- use 'codota/tabnine-vim'
    use {
        'tzachar/cmp-tabnine',
        run = './install.sh', requires = 'hrsh7th/nvim-cmp'
    }
    -- use 'github/copilot.vim'
    -- use 'hrsh7th/cmp-copilot'
    use {
        "zbirenbaum/copilot.lua",
        event = "VimEnter",
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()
            end, 100)
        end,
    }

    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function ()
            require("copilot_cmp").setup({
                method = "getCompletionsCycling",
                formatters = {
                    label = require("copilot_cmp.format").format_label_text,
                    insert_text = require("copilot_cmp.format").format_insert_text,
                    preview = require("copilot_cmp.format").deindent,
                },
            })
        end
    }

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
    -- use {
    --     'akinsho/bufferline.nvim',
    --     tag = "v3.*",
    --     requires = 'kyazdani42/nvim-web-devicons'
    -- }

    -- Startup
    use {
        "glepnir/dashboard-nvim",
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

    -- For tmux
    use 'edkolev/tmuxline.vim'

    if packer_bootstrap then
        packer.sync()
    end
end)
-- }}}
vim.opt.termguicolors = true
vim.cmd('colorscheme darkblue')
-- require("bufferline").setup({})

local db = require('dashboard')
db.custom_header = {
"",
"",
"",
"",
"",
"██╗░░██╗███████╗░░░░░░███╗░░░███╗░█████╗░████████╗██╗░██████╗     ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗",
"██║░██╔╝██╔════╝░░░░░░████╗░████║██╔══██╗╚══██╔══╝╚█║██╔════╝     ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║",
"█████═╝░██████╗░█████╗██╔████╔██║██║░░██║░░░██║░░░░╚╝╚█████╗░     ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║",
"██╔═██╗░╚════██╗╚════╝██║╚██╔╝██║██║░░██║░░░██║░░░░░░░╚═══██╗     ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║",
"██║░╚██╗██████╔╝░░░░░░██║░╚═╝░██║╚█████╔╝░░░██║░░░░░░██████╔╝     ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║",
"╚═╝░░╚═╝╚═════╝░░░░░░░╚═╝░░░░░╚═╝░╚════╝░░░░╚═╝░░░░░░╚═════╝░     ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝",
"",
"",
"",
"█▀▀ █░█ ▄▀█ █▄░█ █▀▀ █▀▀   █▄▄ █▀▀ █▀▀ █▀█ █▀█ █▀▀   █▄█ █▀█ █░█   █░█ ▄▀█ █░█ █▀▀   ▀█▀ █▀█ ░",
"█▄▄ █▀█ █▀█ █░▀█ █▄█ ██▄   █▄█ ██▄ █▀░ █▄█ █▀▄ ██▄   ░█░ █▄█ █▄█   █▀█ █▀█ ▀▄▀ ██▄   ░█░ █▄█ ▄",
"",
"",
}

db.custom_center = {
    {
        icon = '  ',
        desc = 'Recently latest session                 ',
        shortcut = 'SPC s l',
        action ='SessionLoad'
    },
    {
        icon = '  ',
        desc = 'Recently opened files                   ',
        action =  'DashboardFindHistory',
        shortcut = 'SPC f h'
    },
    {
        icon = '  ',
        desc = 'Find  File                              ',
        action = 'Telescope find_files find_command=rg,--hidden,--files',
        shortcut = 'SPC f f'
    },
    {
        icon = '  ',
        desc ='File Browser                            ',
        action =  'Telescope file_browser',
        shortcut = 'SPC f b'
    },
    {
        icon = '  ',
        desc = 'Find  word                              ',
        action = 'Telescope live_grep',
        shortcut = 'SPC f w'
    },
    {
        icon = '  ',
        desc = 'Open Personal dotfiles                  ',
        action = 'Telescope dotfiles path=' .. os.getenv('HOME') ..'Documents/GitHub/dotfiles',
        shortcut = 'SPC f d'
    },
}

--   local function footer()
--     -- Number of plugins
--     --local total_plugins = vim.tbl_keys(packer_plugins)
--     local datetime = os.date("%d-%m-%Y %H:%M:%S")
--     local plugins_text = "   "
--     --1  .. total_plugins
--       .. " plugins"
--       .. "   v"
--       .. vim.version().major
--       .. "."
--       .. vim.version().minor
--       .. "."
--       .. vim.version().patch
--       .. "   "
--       .. datetime
--
--     -- Quote
--     --local fortune = require "alpha.fortune"
--     --local quote = table.concat(fortune(), "\n")
--
--     return plugins_text
--     --.. "\n" .. quote
--   end
--
--
-- db.custom_footer = footer

require('plugins.statusline')
require('plugins.lsp')
require('plugins.completion')
require('plugins.colorscheme')
require('plugins.editor')
require('plugins.syntax')
require('plugins.filer')
require('plugins.telescope')

local keymap = vim.keymap.set
local status, lspsaga = pcall(require, "lspsaga")
if (not status) then return end

lspsaga.init_lsp_saga()

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })


