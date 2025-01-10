local wezterm = require 'wezterm'

local sessionizer = wezterm.plugin.require 'https://github.com/mikkasendke/sessionizer.wezterm'
local merge = require '../utils/merge'

local module = {}

function module.apply(config)
  sessionizer.apply_to_config(config, true)
  sessionizer.config.paths = '/Users/nonames/Projects'
  sessionizer.config.command_options.fd_path = '/opt/homebrew/bin/fd'
  sessionizer.config.show_default = true

  -- These will need to be merged with the main wezterm keys.
  local keys = {
    {
      key = 's',
      mods = 'SHIFT|CTRL',
      action = sessionizer.show,
    },
    {
      key = 'a',
      mods = 'SHIFT|CTRL',
      action = sessionizer.show_active,
    },
  }

  merge.all(config.keys, keys)
end

return module
