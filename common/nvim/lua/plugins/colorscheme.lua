return {
  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = true,
  -- },

  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = true,
  -- },

  {
    "binhtran432k/dracula.nvim",
    lazy = false,
    opts = {
      transparent = true,
      lualine_bold = true,
      functions = { italic = true },
      variables = { italic = true },
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      -- on_colors = function(colors)
      --   colors.bg = "#000000"
      -- end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
