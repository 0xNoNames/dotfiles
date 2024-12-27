-- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- BINDS -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- --
local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

local module = {}

function module.apply(config)
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
end

return module
