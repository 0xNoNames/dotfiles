return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "mypy", "basedpyright" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            disableOrganizeImports = true, -- Using Ruff
            basedpyright = {
              analysis = {
                ignore = { "*" }, -- Using Ruff
                typeCheckingMode = "off", -- Using mypy
              },
            },
          },
        },
      },
    },
    --   config = function()
    --     -- local lspconfig = require("lspconfig")
    --     -- Optional: Only required if you need to update the language server settings
    --     vim.lsp.config("ty", {
    --       init_options = {
    --         settings = {
    --           -- ty language server settings go here
    --         },
    --       },
    --     })
    --
    --     -- Required: Enable the language server
    --     vim.lsp.enable("ty")
    --   end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "mypy" },
      },
      linters = {
        mypy = {},
      },
    },
  },

  -- Automatic format file and imports
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
      },
    },
  },
}
