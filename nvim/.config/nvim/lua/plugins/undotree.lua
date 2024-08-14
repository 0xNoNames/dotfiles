return {
  "mbbill/undotree",

  keys = {
    {
      "<leader>uu",
      function()
        vim.cmd.UndotreeToggle()
      end,
      desc = "Undo tree",
    },
  },
}
