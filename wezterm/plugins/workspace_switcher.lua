local wezterm = require("wezterm")
local colors = wezterm.color.get_builtin_schemes()["Dracula (Official)"]

local basename = require("../utils/basename")

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

local module = {}

function module.apply(config, resurrect)
  workspace_switcher.apply_to_config(config)
  workspace_switcher.workspace_formatter = function(label)
    return wezterm.format({
      { Attribute = { Italic = true } },
      { Foreground = { Color = colors.colors.ansi[3] } },
      { Background = { Color = colors.colors.background } },
      { Text = "󱂬 : " .. label },
    })
  end

  wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, path, label)
    window:gui_window():set_right_status(wezterm.format({
      { Attribute = { Intensity = "Bold" } },
      { Foreground = { Color = colors.colors.ansi[5] } },
      { Text = basename(path) .. "  " },
    }))
    local workspace_state = resurrect.workspace_state

    workspace_state.restore_workspace(resurrect.load_state(label, "workspace"), {
      window = window,
      relative = true,
      restore_text = true,
      on_pane_restore = resurrect.tab_state.default_on_pane_restore,
    })
  end)

  wezterm.on("smart_workspace_switcher.workspace_switcher.chosen", function(window, path, _)
    window:gui_window():set_right_status(wezterm.format({
      { Attribute = { Intensity = "Bold" } },
      { Foreground = { Color = colors.colors.ansi[5] } },
      { Text = basename(path) .. "  " },
    }))
  end)

  wezterm.on("smart_workspace_switcher.workspace_switcher.selected", function(_, _, _)
    local workspace_state = resurrect.workspace_state
    resurrect.save_state(workspace_state.get_workspace_state())
  end)
end

return module
