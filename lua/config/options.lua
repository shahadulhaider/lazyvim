-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.maplocalleader = ";" -- ; is localleader key
vim.opt.list = false -- Don't show invisible characters (tabs, spaces, etc.)
vim.opt.relativenumber = false -- relative line numbers off by default
-- use treesitter to find folds
vim.opt.foldmethod = "indent"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd([[set nofoldenable]]) -- stop auto-fold on file open

vim.g.autoformat = false

vim.g.os = vim.loop.os_uname().sysname
vim.g.open_command = vim.g.os == "Darwin" and "open" or "xdg-open"
-- vim.g.dotfiles = vim.env.DOTFILES or vim.fn.expand("~/.dotfiles")
-- vim.g.vim_dir = vim.g.dotfiles .. "/.config/nvim"
vim.g.vim_dir = vim.fn.expand("~/.config/nvim")
