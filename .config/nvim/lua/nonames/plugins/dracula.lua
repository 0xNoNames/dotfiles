return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'Mofiqul/dracula.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    local dracula = require 'dracula'
    dracula.setup {
      colors = dracula.colors(),
      transparent_bg = true,
      italic_comment = true,
      show_end_of_buffer = false,
      overrides = {},
    }
    vim.cmd.colorscheme 'dracula'
    vim.cmd.hi 'Comment gui=none'
  end,
}
-- vim: ts=2 sts=2 sw=2 et
