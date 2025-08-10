-- -- -- -- -- -- -- -- -- -- ---
-- -- -- --  OPTIONS  -- -- -- --
-- -- -- -- -- -- -- -- -- -- ---
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.wrap = true
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.termguicolors = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.breakindent = true
opt.signcolumn = "yes"
opt.updatetime = 50
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.mouse = "a"
opt.cursorline = true
opt.winborder = "rounded"
opt.tabstop = 4
opt.shiftwidth = 2
opt.smartindent = true
opt.termguicolors = true
vim.diagnostic.config({ virtual_text = { spacing = 4, source = "if_many" } })
opt.timeoutlen = 300 -- Decrease mapped sequence wait time, displays which-key popup sooner
opt.inccommand = "split" -- Preview substitutions live, as you type!
opt.spell = true -- Add spelling check

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- -- -- -- -- -- -- -- -- -- -- -
-- -- -- --  KEY BINDS  -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -
local map = vim.keymap.set
vim.g.mapleader = " "
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("x", "<leader>p", '"_dP', { desc = "Paste without copying" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without copying" })
map("i", "<C-c>", "<Esc>")
map({ "n" }, "<leader>x", "<CMD>!chmod +x %<CR>", { desc = "Make file executable" })
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")
map("n", "<S-h>", "<CMD>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<CMD>bnext<cr>", { desc = "Next Buffer" })
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
-- Disable Q (ex mode in vim)
map("n", "Q", "<nop>")
-- Clear highlights on search when pressing <Esc> in normal mode
function clear_search()
  vim.cmd("noh")
  return "<esc>"
end
map({ "i", "n", "s" }, "<Esc>", clear_search, { expr = true, desc = "Escape and Clear hlsearch" })
map({ "i", "n", "s" }, "<C-c>", clear_search, { expr = true, desc = "Escape and Clear hlsearch" })

-- -- -- -- -- -- -- -- -- -- -- ---
-- -- -- --  LSP KEYMAP  -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- ---
local lsp = vim.lsp
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    map("n", "gd", lsp.buf.definition, { desc = "Goto Definition" })
    map("n", "gr", lsp.buf.references, { desc = "References" })
    map("n", "gI", lsp.buf.implementation, { desc = "Goto Implementation" })
    map("n", "gy", lsp.buf.type_definition, { desc = "Goto T[y]pe Definition" })
    map("n", "gD", lsp.buf.declaration, { desc = "Goto Declaration" })
    map({ "n", "v" }, "<leader>ca", lsp.buf.code_action, { desc = "Code Action" })
    map({ "n", "v" }, "<leader>cc", lsp.codelens.run, { desc = "Run Codelens" })
    map("n", "<leader>cC", lsp.codelens.refresh, { desc = "Refresh & Display Codelens" })
    map("n", "<leader>cr", lsp.buf.rename, { desc = "Rename" })
    map("n", "K", function()
      return lsp.buf.hover()
    end, { desc = "Hover" })
    map("n", "gK", function()
      return lsp.buf.signature_help()
    end, { desc = "Signature Help" })
    map("i", "<c-k>", function()
      return lsp.buf.signature_help()
    end, { desc = "Signature Help" })
    map("n", "<leader>x", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics (Trouble)" })
    map("n", "<leader>z", "<CMD>lua vim.diagnostic.open_float()<CR>", { desc = "Line float diagnostic" })
  end,
})

-- -- -- -- -- -- -- -- -- -- ---
-- -- -- --  PLUGINS  -- -- -- --
-- -- -- -- -- -- -- -- -- -- ---
vim.pack.add({
  { src = "https://github.com/MagicDuck/grug-far.nvim" },
  { src = "https://github.com/benomahony/oil-git.nvim" },
  { src = "https://github.com/binhtran432k/dracula.nvim" },
  { src = "https://github.com/dmtrKovalenko/fff.nvim" },
  { src = "https://github.com/echasnovski/mini.diff" },
  { src = "https://github.com/echasnovski/mini.icons" },
  { src = "https://github.com/folke/trouble.nvim" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/kdheepak/lazygit.nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mfussenegger/nvim-lint" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
})

-- mypy + basedpyright + ruff
-- toggle diagnostics, format and spelling

lsp.enable({ "lua_ls", "ruff", "basedpyright" }) -- uv tool install ruff basedpyright mypy

require("blink.cmp").setup() -- cd ~/.local/share/nvim/site/pack/core/opt/blink.cmp && cargo build --release
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format", "ruff_organize_imports" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
require("fff").setup() -- cd ~/.local/share/nvim/site/pack/core/opt/fff.nvim && cargo build --release
require("grug-far").setup()
require("mini.icons").setup()
require("mason").setup()
require("mini.diff").setup()
require("oil").setup({
  columns = {
    "icon",
  },
  view_options = { show_hidden = true },
})
require("oil-git").setup()
require("telescope").setup()
require("trouble").setup()
vim.lsp.config("basedpyright", {
  settings = {
    disableOrganizeImports = true, -- Using Ruff
    basedpyright = {
      analysis = {
        ignore = { "*" }, -- Using Ruff
        typeCheckingMode = "off", -- Using mypy
      },
    },
  },
})

require("nvim-treesitter").setup({
  ensure_installed = {
    "bash",
    "rust",
    "c",
    "diff",
    "html",
    "javascript",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "python",
    "regex",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
    "css",
    "query",
    "toml",
    "json",
  },
})

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

-- Create auto command which carries out the actual linting
-- on the specified events.
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

-- -- -- -- -- -- -- -- -- -- -- -- -- -
-- -- -- --  PLUGIN KEYMAPS  -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -
map("n", "<leader>sg", "<CMD>Telescope live_grep<CR>", { desc = "Open live grep" })
map("n", "<leader>g", "<CMD>LazyGit<CR>", { desc = "Open lazygit" })
map("n", "<leader>e", function()
  require("oil").toggle_float()
end, { desc = "Open Oil" })
map("n", "<leader>sr", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= "" and "*." .. ext or nil,
    },
  })
end, { desc = "Search and Replace" })
map("n", "<leader><leader>", function()
  require("fff").find_files()
end, { desc = "Open file picker" })

-- -- -- -- -- -- -- -- -- -- --
-- -- -- --  COLORS  -- -- -- --
-- -- -- -- -- -- -- -- -- -- --
require("dracula").setup()
vim.cmd("colorscheme dracula")
vim.cmd(":hi statusline guibg=NONE")
