local wezterm = require 'wezterm'
local config = wezterm.config_builder()

require('modules.binds').apply(config)
require('modules.colors').apply(config)
require('modules.general').apply(config)
require('modules.tabs').apply(config)
require('plugins.smart_splits').apply(config)
require('plugins.sessionizer').apply(config)

--  Not using unix domaine when using Windows
if wezterm.target_triple ~= 'x86_64-pc-windows-msvc' then
  config.default_gui_startup_args = { 'connect', 'unix' }
end

return config
