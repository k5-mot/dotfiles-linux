local wezterm = require 'wezterm'
return {
  font = wezterm.font_with_fallback {
    'CaskaydiaCove Nerd Font',
    'RictyDiminished',
    'Cascadia Code',
    'Fira Code',
    'JetBrains Mono',
    'Powerline Extra Symbols',
    'Noto Color Emoji',
  },
  font_size = 10.0,

  -- color_scheme = "Gruvbox Dark",
  -- color_scheme = "Material (base16)",
  -- color_scheme = "Material (Gogh)",
  -- color_scheme = "Molokai",
  -- color_scheme = "OneDark (base16)",
  -- color_scheme = "OneDark (Gogh)",
  -- color_scheme = "OneHalfDark",
  color_scheme = "tokyonight-storm",

  -- colors = {
  --   background = '#282C34',
  --   selection_bg ='#282C34',
  -- },

  background = {
    {
      source = {
		-- File = '/home/users/kmoto/Pictures/Wallpapers/white.jpg',
        File = "/home/users/kmoto/Pictures/Wallpapers/tile.gif",
      },
      attachment = 'Fixed',
      width  = '100%',
      height = 'Contain',
      -- height = '100%',
      -- width  = 'Contain',
      hsb = {
        brightness = 0.15,
        hue = 1.0,
        saturation = 1.0,
      },
      opacity = 1.0,
    },
  },

  -- window_background_image = '/home/users/kmoto/Pictures/Wallpapers/space.jpg',
  -- window_background_image_hsb = {
  --   brightness = 0.04,
  --   hue = 1.0,
  --   saturation = 1.0,
  -- },
  -- window_background_opacity = 1.0,
  tab_max_width = 10,

}

