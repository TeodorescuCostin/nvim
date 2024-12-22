-- Basic settings
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

-- Load plugins
require("costin.packer")

-- Load keymaps
require("costin.remap")

-- Load theme management
require("costin.theme")
