-- OPTIONS --
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

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Decrease mapped sequence wait time, displays which-key popup sooner
opt.timeoutlen = 300

-- Preview substitutions live, as you type!
opt.inccommand = "split"

vim.diagnostic.config({ virtual_text = { spacing = 4, source = "if_many" } })


-- KEYBINDS --
local map = vim.keymap.set
vim.g.mapleader = " "
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("x", "<leader>p", '"_dP', { desc = "Paste without copying" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without copying" })
map("i", "<C-c>", "<Esc>")
map({ "n" }, "<leader>fx", ":!chmod +x %<CR>", { desc = "Make file executable" })
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- Disable Q (ex mode in vim)
map("n", "Q", "<nop>")

-- Clear highlights on search when pressing <Esc> in normal mode
function clear_search()
  vim.cmd("noh")
  return "<esc>"
end
map({ "i", "n", "s" }, "<Esc>", clear_search, { expr = true, desc = "Escape and Clear hlsearch" })
map({ "i", "n", "s" }, "<C-c>", clear_search, { expr = true, desc = "Escape and Clear hlsearch" })


-- PLUGIN --

vim.pack.add({
	-- { src = "https://github.com/dmtrKovalenko/fff.nvim" },
	-- { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/binhtran432k/dracula.nvim"},
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/folke/which-key.nvim' },
	{ src = 'https://github.com/folke/trouble.nvim' },
	{ src = 'https://github.com/WilliamHsieh/overlook.nvim' },
})


require "mason".setup()
require "trouble".setup()

-- map('n', '<leader><leader>', ":Pick files<CR>")
-- map('n', '<leader>h', ":Pick help<CR>")
map('n', '<leader>e', ":Oil<CR>")
map('n', "<leader>x",  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", {desc = "Buffer Diagnostics (Trouble)"})
vim.lsp.enable({ "lua_ls", "ruff", "ty" })

-- colors
require "dracula".setup({ transparent = true })
vim.cmd("colorscheme dracula")
vim.cmd(":hi statusline guibg=NONE")
