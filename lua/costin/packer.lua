-- This file can be loaded by calling `lua require('plugins')` from your init.lua

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP Support
  use {
	  "neovim/nvim-lspconfig",
	  requires = {
		  "williamboman/mason.nvim",
		  "williamboman/mason-lspconfig.nvim",
	  }
  }

  -- Autocompletion
  use {
	  'hrsh7th/nvim-cmp',
	  requires = {
		  'hrsh7th/cmp-nvim-lsp',
		  'hrsh7th/cmp-buffer',
		  'hrsh7th/cmp-path',
		  'hrsh7th/cmp-cmdline',
		  'L3MON4D3/LuaSnip',
		  'saadparwaiz1/cmp_luasnip',
	  }
  }

  -- Copilot
  use 'github/copilot.vim'

  -- Additional useful plugins
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,
  }
  use 'windwp/nvim-autopairs'
  use 'numToStr/Comment.nvim'

  -- Theme
  use({
	  'projekt0n/github-nvim-theme',
	  config = function()
		  require('github-theme').setup({})
	  end
  })
  use('doums/darcula')

  -- Harpoon
  use {
	  'ThePrimeagen/harpoon',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Telescope
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
