-- -- -- -- -- -- --- -- -- -- -- --
-- -- -- -- -- COLORS -- -- -- -- --
-- -- -- -- -- -- --- -- -- -- -- --
local module = {}

function module.apply(config)
  -- config.colors = wezterm.color.load_base16_scheme '/Users/nonames/.cache/wal/colors.wez'
  -- local home = wezterm.home_dir
  -- wezterm.add_to_config_reload_watch_list(home .. '/.cache/wal/colors-wez.toml')
  -- config.color_scheme_dirs = { home .. '/.cache/wal/' }
  -- config.color_scheme = 'colors-wez'
  config.color_scheme = "Dracula (Official)"
  config.colors = {
    background = "#000000",
  }
end

return module
