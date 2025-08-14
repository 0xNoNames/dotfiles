return {
  { -- LSP
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

  { -- Linting
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        python = { "mypy" },
      }

      vim.list_extend(lint.linters.mypy.args, {
        "--python-executable",
        function()
          return vim.fn.exepath("python3") or vim.fn.exepath("python")
        end,
      })

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  { -- Automatic format file and imports
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
      },
    },
  },
}
