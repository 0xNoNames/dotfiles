-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Center line visually
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete and paste without copying
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without copying" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without copying" })

-- CTRL + C as escape
vim.keymap.set("i", "<C-c>", "<Esc>")
-- Disable Q (ex mode in vim)
vim.keymap.set("n", "Q", "<nop>")

-- Clear highlights on search when pressing <Esc> in normal mode
function clear_search()
  vim.cmd("noh")
  LazyVim.cmp.actions.snippet_stop()
  return "<esc>"
end
vim.keymap.set({ "i", "n", "s" }, "<Esc>", clear_search, { expr = true, desc = "Escape and Clear hlsearch" })
vim.keymap.set({ "i", "n", "s" }, "<C-c>", clear_search, { expr = true, desc = "Escape and Clear hlsearch" })

vim.keymap.set({ "n" }, "<leader>fx", ":!chmod +x %<CR>", { desc = "Make file executable" })

-- In insert or command mode, move normally by using Ctrl
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- Disable ctrl-w move lazyvim default
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
