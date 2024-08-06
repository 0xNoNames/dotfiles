return {
  "stevearc/conform.nvim",
  opts = function()
    local plugin = require("lazy.core.config").plugins["conform.nvim"]
    ---@type conform.setupOpts
    local opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "ruff_organize_imports" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        javascript = { "prettier" },
        typerscript = { "prettier" },
        less = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
      },
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    }
    return opts
  end,
}
