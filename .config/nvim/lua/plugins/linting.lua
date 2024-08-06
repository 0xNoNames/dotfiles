return {
  "mfussenegger/nvim-lint",
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      fish = { "fish" },
      ansible = { "ansible-lint" },
      javascript = { "biome" },
      typescript = { "biome" },
      json = { "jsonlint" },
      markdown = { "markdownlint" },
      python = { "mypy" },
    },
    linters = {
      mypy = {
        args = {
          "--show-column-numbers",
          "--show-error-end",
          "--hide-error-codes",
          "--hide-error-context",
          "--no-color-output",
          "--no-error-summary",
          "--no-pretty",
          "--ignore-missing-imports",
          "--disable-error-code=import-untyped",
        },
      },
    },
  },
}
