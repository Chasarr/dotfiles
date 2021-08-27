return require('packer').startup(function()
	-- To avoid warning messages by using global use functions
	local use = require('packer').use
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	---- Fuzzy finder ----
	use{
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

	---- Treesitter, for better highlighting and language support ----
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	require 'plugins.treesitter'

	----- Language Server Protocol (LSP) ----
	use 'neovim/nvim-lspconfig'
	require 'plugins.lsp'		--LSP configs
	--cmp, autocompletion
	use {
  		"hrsh7th/nvim-cmp",
  		requires = {
    	"hrsh7th/cmp-buffer",
  		}
	}
	-- autopairs
	use 'windwp/nvim-autopairs'
	require 'plugins.autopairs'
	require('nvim-autopairs').setup{}
	-- LuaSnip integration with lsp
	use 'hrsh7th/cmp-nvim-lsp'

	-- LuaSnip integration with cmp
	 use 'saadparwaiz1/cmp_luasnip'

	-- LuaSnip
	use 'L3MON4D3/LuaSnip'

	--cmp configs
	require 'plugins.cmp'

	-- Lualine
	use {
  		'hoob3rt/lualine.nvim',
  		require = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	require 'plugins.lualine'

	-- Sonokai color scheme settings
	use 'sainnhe/sonokai'
	require 'plugins.sonokai'
  end)
