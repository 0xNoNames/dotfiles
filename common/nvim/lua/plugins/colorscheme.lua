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
      -- style = "soft",
      on_colors = function(colors)
        colors.bg = "#000000"
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
