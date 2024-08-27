return {
  "nvimdev/dashboard-nvim",
  dependencies = { "MaximilianLloyd/ascii.nvim", requires = "MunifTanjim/nui.nvim" },
  opts = function(_, opts)
    local ascii = require("ascii")
    local logo = ascii.get_random("text", "neovim")
    logo = string.rep("\n", 10) .. table.concat(logo, "\n") .. string.rep("\n", 2)
    opts.config.header = vim.split(logo, "\n")
    return opts
  end,
}
