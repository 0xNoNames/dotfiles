return {
  "petertriho/nvim-scrollbar",
  dependencies = {
    "kevinhwang91/nvim-hlslens",
  },
  init = function()
    require("scrollbar").setup({
      hide_if_all_visible = true,
      throttle_ms = 50,
      handlers = {
        cursor = false,
      },
      handle = {
        text = " ",
        blend = 0,
        highlight = "CursorColumn",
        hide_if_all_visible = true,
      },
      marks = {
        GitAdd = {
          text = "▎",
          priority = 7,
          highlight = "GitSignsAdd",
        },
        GitChange = {
          text = "▎",
          priority = 7,
          highlight = "GitSignsChange",
        },
        GitDelete = {
          text = "◀",
          priority = 7,
          highlight = "GitSignsDelete",
        },
      },
    })
    require("scrollbar.handlers.search").setup()
    require("gitsigns").setup()
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
