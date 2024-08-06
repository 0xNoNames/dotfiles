return {
  {
    "Mofiqul/dracula.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      local dracula = require("dracula")
      dracula.setup({
        colors = {
          dracula.colors(),
          selection = "#111111",
        },
        transparent_bg = true,
        italic_comment = true,
        show_end_of_buffer = false,
        overrides = {},
      })
      vim.cmd.colorscheme("dracula")
    end,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula-soft",
    },
  },
}
