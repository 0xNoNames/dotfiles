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
-- vim.keymap.set("i", "<C-c>", "<Esc>")
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
