local keymap = vim.keymap -- haz las cosas facil..

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
-- vim.opt.autoindent = true
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- termgui colors
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Splitt Windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Mine
vim.opt.scrolloff = 8

-- Remove line highlighting
vim.cmd([[highlight clear CursorLine]])

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
-- Bracket and quote completion for Lua
