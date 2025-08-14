return {
	{
	  "stevearc/oil.nvim",
	  dependencies = {"echasnovski/mini.icons"},
	  opts = {
		columns = { "icon" },
		view_options = { show_hidden = true },
	  },
	  keys = {
	    {
	      "<leader>e",
	      function()
		require("oil").toggle_float()
	      end,
	      desc = "Open oil",
	    },
	  },
	},
	{
		"benomahony/oil-git.nvim",
	}
}
