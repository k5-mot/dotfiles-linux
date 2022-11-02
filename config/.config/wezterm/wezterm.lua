local wezterm = require 'wezterm'
return {
    font = wezterm.font_with_fallback {
        'Cascadia Code',
        'Noto Color Emoji',
        'Noto Emoji',
        'Powerline Extra Symbols',
        'CaskaydiaCove Nerd Font',
        -- 'RictyDiminished',
        'DejaVu Sans Mono',
        -- 'Fira Code',
        -- 'JetBrains Mono',
    },
    font_size = 11.0,
    -- default_prog = { '/bin/zsh', '-l' },
    check_for_updates = false,

    -- color_scheme = "Gruvbox Dark",
    -- color_scheme = "Material (base16)",
    -- color_scheme = "Material (Gogh)",
    -- color_scheme = "Molokai",
    -- color_scheme = "OneDark (base16)",
    -- color_scheme = "OneDark (Gogh)",
    -- color_scheme = "OneHalfDark",
    color_scheme = "tokyonight-storm",
    -- color_scheme = "Sonokai (Gogh)",

    background = {
        {
            source = {
                -- File = '/home/users/kmoto/Pictures/Wallpapers/white.jpg',
                File = "/home/users/kmoto/Pictures/Wallpapers/mount_fuji2.jpg",
            },
            attachment = 'Fixed',
            width  = '100%',
            height = 'Contain',
            -- height = '100%',
            -- width  = 'Contain',
            hsb = {
                brightness = 0.25,
                hue = 1.0,
                saturation = 1.0,
            },
            opacity = 1.0,
        },
    },

    tab_max_width = 10,
    --tab_bar_at_bottom = true,
    -- exit_behaviors = 'Close',

    keys = {
        {
            key    = 'n',
            mods   = 'SHIFT|CTRL',
            action = wezterm.action.ToggleFullScreen,
        },
    }
}

