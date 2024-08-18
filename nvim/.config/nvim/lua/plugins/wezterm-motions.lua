return {
  "mrjones2014/smart-splits.nvim",
  keys = {
    {
      "<C-A-h>",
      function()
        require("smart-splits").resize_left()
      end,
    },
    {
      "<C-A-j>",
      function()
        require("smart-splits").resize_down()
      end,
    },
    {
      "<C-A-k>",
      function()
        require("smart-splits").resize_up()
      end,
    },
    {
      "<C-A-l>",
      function()
        require("smart-splits").resize_right()
      end,
    },
    {
      "<C-C-S-h>",
      function()
        require("smart-splits").move_cursor_left()
      end,
    },
    {
      "<C-S-j>",
      function()
        require("smart-splits").move_cursor_down()
      end,
    },
    {
      "<C-S-k>",
      function()
        require("smart-splits").move_cursor_up()
      end,
    },
    {
      "<C-S-l>",
      function()
        require("smart-splits").move_cursor_right()
      end,
    },
    -- {
    --   "<leader><leader>h",
    --   function()
    --     require("smart-splits").swap_buf_left()
    --   end,
    -- },
    -- {
    --   "<leader><leader>j",
    --   function()
    --     require("smart-splits").swap_buf_down()
    --   end,
    -- },
    -- {
    --   "<leader><leader>k",
    --   function()
    --     require("smart-splits").swap_buf_up()
    --   end,
    -- },
    -- {
    --   "<leader><leader>l",
    --   function()
    --     require("smart-splits").swap_buf_right()
    --   end,
    -- },
  },
}
