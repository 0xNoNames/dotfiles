return {
  "dmtrKovalenko/fff.nvim",
  build = "cargo build --release",
  keys = {
    {
      "<leader><leader>",
      function()
        require("fff").find_files()
      end,
      desc = "Open file picker",
    },
  },
  opts = {},
}
