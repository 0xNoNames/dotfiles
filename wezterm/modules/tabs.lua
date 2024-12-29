-- -- -- -- -- -- -- --- -- -- -- -- -- -- -- --
-- -- -- -- -- TABS CONFIGURATION -- -- -- -- --
-- -- -- -- -- -- -- --- -- -- -- -- -- -- -- --
local wezterm = require("wezterm")
local colors = wezterm.color.get_builtin_schemes()["Dracula (Official)"]

local module = {}

function module.apply(config)
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
    local foreground = colors.foreground

    if tab.is_active then
      background = colors.ansi[6]
      foreground = "transparent"
    elseif hover then
      background = colors.ansi[7]
      foreground = "transparent"
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
end

return module
