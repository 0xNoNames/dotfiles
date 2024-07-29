local wezterm = require 'wezterm'
local mux = wezterm.mux
return {
  color_scheme = 'Dracula (Official)',
  colors = {
    background = '#000000',
  },
  enable_tab_bar = false,
  font_size = 14.0,
  font = wezterm.font 'JetBrainsMono Nerd Font Mono', -- Liga SFMono Nerd Font or Iosevka Term or JetBrainsMono Nerd Font Mono
  macos_window_background_blur = 30,

  window_background_opacity = 0.40,
  window_decorations = 'RESIZE | TITLE',
  keys = {
    {
      key = 'f',
      mods = 'CMD',
      action = wezterm.action.ToggleFullScreen,
    },
  },
  mouse_bindings = {
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
  },

  wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
  end),
}
