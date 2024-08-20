return {
  { "MaximilianLloyd/ascii.nvim", requires = "MunifTanjim/nui.nvim" },

  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local ascii = require("ascii")
      local logo = ascii.get_random("text", "neovim")

      -- logo = string.rep("\n", 8) .. logo .. "\n\n"

      -- opts.config.header = vim.split(logo, "\n")
      opts.config.header = logo
      return opts
    end,
  },
}
