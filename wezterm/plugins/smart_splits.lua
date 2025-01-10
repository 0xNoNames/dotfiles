local wezterm = require 'wezterm'

local smart_splits = wezterm.plugin.require 'https://github.com/mrjones2014/smart-splits.nvim'

local module = {}

function module.apply(config)
  smart_splits.apply_to_config(config, {
    direction_keys = { 'h', 'j', 'k', 'l' },
    modifiers = {
      move = 'CTRL|SHIFT',
      resize = 'CTRL|ALT',
    },
  })
end

return module
