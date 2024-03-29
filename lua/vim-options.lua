local opt = vim.opt

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.number = true
opt.relativenumber = true

vim.opt.termguicolors = true
vim.g.mapleader = " "

vim.cmd([[
set shell=pwsh
set shellcmdflag=-command
set shellquote=\"
set shellxquote=
]])
