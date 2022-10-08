-- [[ lualine.lua ]]

require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'tokyonight',
        component_separators = { left = ' ', right = ' ' },
        section_separators   = { left = ' ', right = ' ' },
        --component_separators = { left = '', right = ''},
        --section_separators   = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
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
        lualine_a = {},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},--'buffers'},
        lualine_z = {'tabs'}
    },
    --winbar = {
    --  lualine_a = {},
    --  lualine_b = {},
    --  lualine_c = {'filename'},
    --  lualine_x = {},
    --  lualine_y = {},
    --  lualine_z = {}
    --},

    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    extensions = {}
})

