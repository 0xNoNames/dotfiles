-- LSP keymaps
return {
  "neovim/nvim-lspconfig",

  opts = function(_, opts)
    opts.servers = {
      ruff = {
        on_attach = function(client, _)
          client.server_capabilities.hoverProvider = false
        end,
      },
      pyright = {
        capabilities = {
          textDocument = {
            publishDiagnostics = {
              tagSupport = {
                valueSet = { 2 },
              },
            },
          },
        },
        settings = {
          pyright = {
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
    }
  end,
}
