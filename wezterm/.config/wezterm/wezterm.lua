local wezterm = require 'wezterm'
local smart_splits = wezterm.plugin.require 'https://github.com/mrjones2014/smart-splits.nvim'
local config = wezterm.config_builder()

-- config.colors = wezterm.color.load_base16_scheme '/Users/nonames/.cache/wal/colors.wez'
-- local home = wezterm.home_dir
-- wezterm.add_to_config_reload_watch_list(home .. '/.cache/wal/colors-wez.toml')
-- config.color_scheme_dirs = { home .. '/.cache/wal/' }
-- config.color_scheme = 'colors-wez'
config.color_scheme = 'Dracula (Official)'
config.colors = {
  background = '#000000',
}

config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.font_size = 14.0
config.font = wezterm.font 'JetBrainsMono Nerd Font Mono' -- Liga SFMono Nerd Font or Iosevka Term or JetBrainsMono Nerd Font Mono
config.window_decorations = 'NONE | RESIZE'
config.window_background_opacity = 0.75
config.macos_window_background_blur = 50
config.window_close_confirmation = 'NeverPrompt'

config.keys = {
  { mods = 'CTRL|SHIFT', key = 'q', action = wezterm.action.CloseCurrentPane { confirm = false } },

  {
    mods = 'CTRL|SHIFT',
    key = 'f',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    mods = 'CTRL|SHIFT',
    key = 'o',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    mods = 'CTRL|SHIFT',
    key = 'p',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    mods = 'CTRL|SHIFT',
    key = 'f',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    mods = 'CTRL|SHIFT',
    key = 'Space',
    action = wezterm.action.RotatePanes 'Clockwise',
  },
  {
    mods = 'CTRL|SHIFT',
    key = '0',
    action = wezterm.action.PaneSelect {
      mode = 'SwapWithActive',
    },
  },
  {
    mods = 'CTRL|SHIFT',
    key = 'Enter',
    action = wezterm.action.ActivateCopyMode,
  },
}
smart_splits.apply_to_config(config, {
  direction_keys = { 'h', 'j', 'k', 'l' },
  modifiers = {
    move = 'CTRL|SHIFT',
    resize = 'CTRL|ALT',
  },
})
return config
