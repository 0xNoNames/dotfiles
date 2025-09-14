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

  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  -- },

  -- {
  --   "EdenEast/nightfox.nvim", -- carbonfox
  --   lazy = false,
  --   opts = {
  --     options = {
  --       transparent = true,
  --       styles = {
  --         comments = "italic",
  --         functions = "italic",
  --         variables = "italic",
  --       },
  --     },
  --   },
  -- },

  {
    "binhtran432k/dracula.nvim",
    lazy = false,
    opts = {
      lualine_bold = true,
      functions = { italic = true },
      variables = { italic = true },
      comments = { italic = true },
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      transparent = true,
      on_colors = function(colors)
        colors.bg = "#000000"
      end,
      -- on_highlights = function(hl, c)
      --   hl.DiagnosticVirtualTextError = { bg = c.none, fg = c.error }
      --   hl.DiagnosticVirtualTextWarn = { bg = c.none, fg = c.warning }
      --   hl.DiagnosticVirtualTextInfo = { bg = c.none, fg = c.info }
      --   hl.DiagnosticVirtualTextHint = { bg = c.none, fg = c.hint }
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
