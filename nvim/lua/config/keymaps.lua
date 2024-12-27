-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without copying" })
-- vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete without copying" })
-- vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without coyping" })
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")

-- Clear highlights on search when pressing <Esc> in normal mode
--  See`:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
