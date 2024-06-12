local opt = vim.opt

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable relative line numbers
opt.nu = true
opt.relativenumber = true

-- Set tabs to 2 spaces
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

-- Enable auto indenting
opt.smartindent = true
opt.shiftwidth = 2

-- Enable smart indenting
opt.breakindent = true

-- Enable incremental searching
opt.hlsearch = false
opt.incsearch = true

-- Enable ignorecase + smartcase for better searching
opt.ignorecase = true
opt.smartcase = true

-- Have pwetty cowos
opt.termguicolors = true

-- Enable scroll off and signcolumn
opt.scrolloff = 10
opt.signcolumn = "yes"
opt.isfname:append({ "@-@" })

-- Decrease updatetime to 200ms
opt.updatetime = 50

-- Ensure that things are always visible
opt.conceallevel = 0

-- Enable column line on the right
opt.colorcolumn = "120"

-- Enable row highlight
opt.cursorline = true

-- Better splitting
opt.splitbelow = true
opt.splitright = true

-- Enable sign column to prevent jumping
opt.signcolumn = "yes"

-- Disbale mouse
opt.mouse = ""

vim.cmd([[
set shell=pwsh
set shellcmdflag=-command
set shellquote=\"
set shellxquote=
]])
