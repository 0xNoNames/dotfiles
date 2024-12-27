local config = require('wezterm').config_builder()

require('modules/binds').apply(config)
require('modules/general').apply(config)
require('modules/tabs').apply(config)
require('modules/colors').apply(config)

return config
