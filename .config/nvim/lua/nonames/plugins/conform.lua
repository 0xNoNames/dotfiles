-- Autoformat
return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_format', 'ruff_organize_imports', 'ruff_fix' },
      css = { 'prettier' },
      html = { 'prettier' },
      json = { 'prettier' },
      javascript = { 'prettier' },
      less = { 'prettier' },
      markdown = { 'prettier' },
      yaml = { 'prettier' },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
