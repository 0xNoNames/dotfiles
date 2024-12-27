-- Wezterm API
local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local config = wezterm.config_builder()

-- -- -- -- -- -- -- -- -- - -- -- -- -- -- -- -- --
-- -- -- -- -- GENERAL CONFIGURATIONS -- -- -- -- --
-- -- -- -- -- -- -- -- -- - -- -- -- -- -- -- -- --
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

-- -- -- -- -- -- --- -- -- -- -- --
-- -- -- -- -- COLORS -- -- -- -- --
-- -- -- -- -- -- --- -- -- -- -- --
-- config.colors = wezterm.color.load_base16_scheme '/Users/nonames/.cache/wal/colors.wez'
-- local home = wezterm.home_dir
-- wezterm.add_to_config_reload_watch_list(home .. '/.cache/wal/colors-wez.toml')
-- config.color_scheme_dirs = { home .. '/.cache/wal/' }
-- config.color_scheme = 'colors-wez'
config.color_scheme = "Dracula (Official)"

-- -- -- -- -- -- -- --- -- -- -- -- -- -- -- --
-- -- -- -- -- TABS CONFIGURATION -- -- -- -- --
-- -- -- -- -- -- -- --- -- -- -- -- -- -- -- --
config.tab_max_width = 16
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.window_frame = {
  font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
  font_size = 10.0,
  active_titlebar_bg = "transparent",
}
wezterm.on("format-tab-title", function(tab, _, _, conf, hover, _)
  local title = "  " .. tab.tab_index + 1 .. ": " .. tab.active_pane.title
  local width = conf.tab_max_width
  if #title > conf.tab_max_width then
    title = wezterm.truncate_right(title, width) .. "…"
  end

  local background = "rgba(255,255,255,0.1)"
  local foreground = "#f8f8f2"

  if tab.is_active then
    background = "#bd93f9"
    foreground = "transparent"
  elseif hover then
    background = "#6272a4"
    foreground = "#f8f8f2"
  end

  return {

    { Background = { Color = "transparent" } },
    { Foreground = { Color = "transparent" } },
    { Text = " " },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Text = "  " },
    { Background = { Color = "transparent" } },
    { Foreground = { Color = "transparent" } },
    { Text = " " },
  }
end)

config.colors = {
  tab_bar = {
    inactive_tab_edge = "transparent",
  },
}

-- -- -- -- -- -- --- -- -- -- -- -- --
-- -- -- -- -- KEY BINDS -- -- -- -- --
-- -- -- -- -- -- --- -- -- -- -- -- --
config.keys = {
  {
    mods = "CTRL|SHIFT",
    key = "q",
    action = wezterm.action.CloseCurrentPane({ confirm = false }),
  },
  {
    mods = "CTRL|SHIFT",
    key = "o",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "CTRL|SHIFT",
    key = "p",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "CTRL|SHIFT",
    key = "f",
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    mods = "CTRL|SHIFT",
    key = "Space",
    action = wezterm.action.RotatePanes("Clockwise"),
  },
  {
    mods = "CTRL|SHIFT",
    key = "0",
    action = wezterm.action.PaneSelect({
      mode = "SwapWithActive",
    }),
  },
  {
    mods = "CTRL|SHIFT",
    key = "Enter",
    action = wezterm.action.ActivateCopyMode,
  },
}

smart_splits.apply_to_config(config, {
  direction_keys = { "h", "j", "k", "l" },
  modifiers = {
    move = "CTRL|SHIFT",
    resize = "CTRL|ALT",
  },
})

-- Change the default click behavior so that it only selects
-- text and doesn't open hyperlinks
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.CompleteSelection("ClipboardAndPrimarySelection"),
  },
  -- Open URLs with CTRL + SHIFT + CLICK
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL|SHIFT",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

return config
