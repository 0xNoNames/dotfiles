-- -- -- -- -- -- -- -- -- - -- -- -- -- -- -- -- --
-- -- -- -- -- GENERAL CONFIGURATIONS -- -- -- -- --
-- -- -- -- -- -- -- -- -- - -- -- -- -- -- -- -- --
local wezterm = require 'wezterm'
local mux = wezterm.mux
local colors = wezterm.color.get_builtin_schemes()['Dracula (Official)']

local basename = require '../utils/basename'

local module = {}

function module.apply(config)
  config.unix_domains = { {
    name = 'unix',
  } }
  config.max_fps = 240
  config.status_update_interval = 1000
  config.font_size = 12.0
  config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'
  config.window_decorations = 'NONE | RESIZE'
  config.window_close_confirmation = 'NeverPrompt'
  config.window_background_opacity = 0.75
  config.switch_to_last_active_tab_when_closing_tab = true
  config.show_close_tab_button_in_tabs = false
  config.pane_focus_follows_mouse = true
  config.scrollback_lines = 10000
  config.window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 0,
  }
  -- If macOS (arm)
  if wezterm.target_triple == 'aarch64-apple-darwin' then
    config.macos_window_background_blur = 50
    config.window_padding = {
      left = 24,
      right = 24,
      top = 24,
      bottom = 0,
    }
  end
  -- If Windows
  if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { 'ubuntu' }
    config.win32_system_backdrop = 'Acrylic'
  end
  -- Add current date/time as status
  wezterm.on('update-right-status', function(window, _)
    local date = wezterm.strftime '%Y-%m-%d %H:%M:%S'
    local workspace = basename(window:active_workspace())
    local ws_color = colors.ansi[7]
    if workspace == '~' or workspace == 'default' then
      ws_color = colors.ansi[3] -- Green
    end
    window:set_right_status(wezterm.format {
      { Background = { Color = 'transparent' } },
      { Foreground = { Color = ws_color } },
      { Text = workspace },
      { Foreground = { Color = colors.foreground } },
      { Text = ' | ' },
      { Text = date .. ' ' },
    })
  end)

  wezterm.on('gui-startup', function(cmd)
    local _, _, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()

    window:gui_window():set_right_status(wezterm.format {
      { Attribute = { Intensity = 'Bold' } },
      { Background = { Color = 'transparent' } },
      { Foreground = { Color = colors.ansi[3] } },
      { Text = 'default  ' },
    })
  end)
end

return module
