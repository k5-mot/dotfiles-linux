-- [[ statusline.lua ]]

require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'sonokai',
        -- component_separators = { left = '', right = '' },
        -- section_separators   = { left = ' ', right = ' ' },
        component_separators = { left = ' ', right = ' ' },
        section_separators   = { left = ' ', right = ' ' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            'branch',
            {
                'diff',
                colored = true,
                symbols = {added = ' ', modified = ' ', removed = ' '},
            },
            {
                'diagnostics',
                sections = { 'error', 'warn', 'info', 'hint' },
                symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
                colored = true,
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = true,   -- Show diagnostics even if there are none.
            },
        },
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        --lualine_a = {
        --    {
        --        'tabs',
        --        mode = 2,
        --    },
        --},
        --lualine_a = {'filetype'},
        --lualine_b = {'filename'},
        --lualine_c = {},
        --lualine_x = {'close'},
        --lualine_y = {'filename'},--'buffers'},
        --lualine_z = {'tabs'},
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})


--local lsp = require('feline.providers.lsp')
--local vi_mode_utils = require('feline.providers.vi_mode')
--local gps = require("nvim-gps")
--
--require('feline').setup({
--  theme = gruvbox,
----  default_bg = bg,
----  default_fg = fg,
----  vi_mode_colors = vi_mode_colors,
----  components = components,
----  force_inactive = force_inactive,
--})
--
----require('feline').winbar.setup({
----  components = winbar_components,
----  force_inactive = force_inactive,
----})
