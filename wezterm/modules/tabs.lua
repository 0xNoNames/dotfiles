-- -- -- -- -- -- -- --- -- -- -- -- -- -- -- --
-- -- -- -- -- TABS CONFIGURATION -- -- -- -- --
-- -- -- -- -- -- -- --- -- -- -- -- -- -- -- --
local wezterm = require("wezterm")

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
end

return module
