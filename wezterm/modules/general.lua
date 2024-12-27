-- -- -- -- -- -- -- -- -- - -- -- -- -- -- -- -- --
-- -- -- -- -- GENERAL CONFIGURATIONS -- -- -- -- --
-- -- -- -- -- -- -- -- -- - -- -- -- -- -- -- -- --
local wezterm = require("wezterm")

local module = {}

function module.apply(config)
  config.font_size = 12.0
  config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
  config.window_decorations = "NONE | RESIZE"
  config.window_close_confirmation = "NeverPrompt"
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
  if wezterm.target_triple == "aarch64-apple-darwin" then
    config.macos_window_background_blur = 50
  end
  -- If Windows
  if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config.default_prog = { "ubuntu" }
    config.win32_system_backdrop = "Acrylic"
  end
  -- Add current date/time as status
  wezterm.on("update-right-status", function(window, _)
    local date = wezterm.strftime("%Y-%m-%d %H:%M:%S")
    window:set_right_status(wezterm.format({
      { Background = { Color = "transparent" } },
      { Text = date .. " " },
    }))
  end)
end

return module
