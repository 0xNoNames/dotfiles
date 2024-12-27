return {

  -- Pyright + MyPy + Ruff configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          -- capabilities = {
          --   textDocument = {
          --     publishDiagnostics = {
          --       tagSupport = {
          --         valueSet = { 2 },
          --       },
          --     },
          --   },
          -- },
          settings = {
            basedpyright = {
              disableOrganizeImports = true, -- Using Ruff
            },
            python = {
              analysis = {
                ignore = { "*" }, -- Using Ruff
                typeCheckingMode = "off", -- Using mypy
              },
            },
          },
        },
      },
    },
  },

  -- Python LSP server configuration
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       pylsp = {
  --         settings = {
  --           pylsp = {
  --             plugins = {
  --               -- formatter options
  --               autopep8 = { enabled = false },
  --               yapf = { enabled = false },
  --               -- linter options
  --               pylint = { enabled = false },
  --               pyflakes = { enabled = false },
  --               mccabe = { enabled = false },
  --               pycodestyle = { enabled = false },
  --               rope = { enabled = false },
  --               -- type checker
  --               pylsp_mypy = { enabled = true, live_mode = false, dmypy = true, strict = true },
  --               -- auto-completion options
  --               jedi_completion = { enabled = false },
  --             },
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },

  -- MyPy setup
  -- {
  --   "mfussenegger/nvim-lint",
  --   opts = {
  --     linters_by_ft = {
  --       python = { "mypy" },
  --     },
  --     linters = {
  --       mypy = { args = { "--strict" } },
  --     },
  --   },
  -- },

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
