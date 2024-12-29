-- resurrect.wezterm configuration and settings
--
-- This module:
-- * Configures the resurrect.wezterm plugin
-- * Configures event listener configuration (via an additional required file)
-- * Returns wezterm keybinding configuration for resurrect-related actions.
--
-- The main wezterm configuration is then responsible for merging the
-- keybindings with other keybindings, or setting up its own.

local wezterm = require("wezterm")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
local merge = require("../utils/merge")

local module = {}

function module.apply(config)
  -- resurrect.wezterm periodic save every 5 minutes
  resurrect.periodic_save({
    interval_seconds = 300,
    save_tabs = true,
    save_windows = true,
    save_workspaces = true,
  })

  -- Save only 5000 lines per pane
  resurrect.set_max_nlines(5000)

  -- Default keybindings
  -- These will need to be merged with the main wezterm keys.
  local keys = {
    {
      -- Save current and window state
      -- See https://github.com/MLFlexer/resurrect.wezterm for options around
      -- saving workspace and window state separately
      key = "s",
      mods = "CTRL|SHIFT",
      action = wezterm.action_callback(function(_, _) -- luacheck: ignore 212
        local state = resurrect.workspace_state.get_workspace_state()
        resurrect.save_state(state)
        resurrect.window_state.save_window_action()
      end),
    },
    {
      -- Load workspace or window state, using a fuzzy finder
      key = "c",
      mods = "CTRL|SHIFT",
      action = wezterm.action_callback(function(win, pane)
        resurrect.fuzzy_load(win, pane, function(id, _) -- luacheck: ignore 212
          local type = string.match(id, "^([^/]+)") -- match before '/'
          id = string.match(id, "([^/]+)$") -- match after '/'
          id = string.match(id, "(.+)%..+$") -- remove file extension

          local opts = {
            window = win:mux_window(),
            relative = true,
            restore_text = true,
            on_pane_restore = resurrect.tab_state.default_on_pane_restore,
          }

          if type == "workspace" then
            local state = resurrect.load_state(id, "workspace")
            resurrect.workspace_state.restore_workspace(state, opts)
          elseif type == "window" then
            local state = resurrect.load_state(id, "window")
            resurrect.window_state.restore_window(pane:window(), state, opts)
          elseif type == "tab" then
            local state = resurrect.load_state(id, "tab")
            resurrect.tab_state.restore_tab(pane:tab(), state, opts)
          end
        end)
      end),
    },
    {
      -- Delete a saved session using a fuzzy finder
      key = "d",
      mods = "CTRL|SHIFT",
      action = wezterm.action_callback(function(win, pane)
        resurrect.fuzzy_load(win, pane, function(id)
          resurrect.delete_state(id)
        end, {
          title = "Delete State",
          description = "Select session to delete and press Enter = accept, Esc = cancel, / = filter",
          fuzzy_description = "Search session to delete: ",
          is_fuzzy = true,
        })
      end),
    },
  }

  merge.all(config.keys, keys)
  return resurrect
end

return module
