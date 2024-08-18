local wezterm = require 'wezterm'
local smart_splits = wezterm.plugin.require 'https://github.com/mrjones2014/smart-splits.nvim'
local config = wezterm.config_builder()

config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 }

config.color_scheme = 'Dracula (Official)'
config.enable_tab_bar = false
config.font_size = 14.0
config.font = wezterm.font 'JetBrainsMono Nerd Font Mono' -- Liga SFMono Nerd Font or Iosevka Term or JetBrainsMono Nerd Font Mono
config.window_decorations = 'RESIZE | TITLE'

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

config.keys = {
  {
    key = 'f',
    mods = 'CMD',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    mods = 'LEADER',
    key = '-',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    mods = 'LEADER',
    key = '=',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    mods = 'LEADER',
    key = 'f',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    mods = 'LEADER',
    key = 'Space',
    action = wezterm.action.RotatePanes 'Clockwise',
  },
  -- show the pane selection mode, but have it swap the active and selected panes
  {
    mods = 'LEADER',
    key = '0',
    action = wezterm.action.PaneSelect {
      mode = 'SwapWithActive',
    },
  },
  {
    key = 'Enter',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode,
  },
}
smart_splits.apply_to_config(config, {
  direction_keys = { 'h', 'j', 'k', 'l' },
  modifiers = {
    move = 'CTRL',
    resize = 'CMD',
  },
})
return config
