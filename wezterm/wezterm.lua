local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("modules.binds").apply(config)
require("modules.colors").apply(config)
require("modules.general").apply(config)
require("modules.tabs").apply(config)
require("plugins.smart_splits").apply(config)

-- Load resurrect and workspace_switcher when not using Windows
if wezterm.target_triple ~= "x86_64-pc-windows-msvc" then
  local resurrect = require("plugins.resurrect").apply(config)
  require("plugins.workspace_switcher").apply(config, resurrect)
end

return config
