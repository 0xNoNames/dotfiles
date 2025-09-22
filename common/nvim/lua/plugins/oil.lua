return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    columns = { "icon" },
    view_options = { show_hidden = true },
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} }, { "benomahony/oil-git.nvim" } },
  keys = {
    {
      "<leader>e",
      function()
        require("oil").toggle_float()
      end,
      desc = "Open oil",
    },
  },
  lazy = false,
}
