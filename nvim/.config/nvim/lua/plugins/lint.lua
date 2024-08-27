return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      ansible = { "ansible-lint" },
      javascript = { "biome" },
      typescript = { "biome" },
    },
  },
}
