return {
  -- {
  --   "williamboman/mason.nvim",
  --   opts = { ensure_installed = { "mypy" } },
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  -- ruff = {
  --   on_attach = function(client, _)
  --     client.server_capabilities.hoverProvider = false
  --   end,
  -- },
  -- pyright = {
  --   capabilities = {
  --     textDocument = {
  --       publishDiagnostics = {
  --         tagSupport = {
  --           valueSet = { 2 },
  --         },
  --       },
  --     },
  --   },
  --   settings = {
  --     pyright = {
  --       disableOrganizeImports = true, -- Using Ruff
  --     },
  --     python = {
  --       analysis = {
  --         ignore = { "*" }, -- Using Ruff
  --         typeCheckingMode = "off", -- Using mypy
  --       },
  --     },
  --   },
  -- },
  --     },
  --   },
  -- },
  -- {
  --   "mfussenegger/nvim-lint",
  --   opts = {
  --     linters_by_ft = {
  --       python = { "mypy" },
  --     },
  --     linters = {
  --       mypy = {},
  --     },
  --   },
  -- },
  --
  -- Automatic format imports
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
      },
    },
  },
}
