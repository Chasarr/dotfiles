return require('packer').startup(function()
	-- To avoid warning messages by using global use functions
	local use = require('packer').use
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	--require 'telescope'.setup()
	-- Fuzzy finder
	use{
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

	---- Tree-sitter, for better highlighting and language support ----
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	-- Tree-sitter settings
	require 'nvim-treesitter.configs'.setup {
		ensure_installed = "maintained",
		highlight = {
			enable = true
		}
	}
	---- Language Server Protocol ----
	use 'neovim/nvim-lspconfig'
	local lsp = require 'lspconfig'
	-- sudo pacman -S pyright
	lsp.pyright.setup{}
	-- julia -e 'using Pkg; Pkg.add("LanguageServer"); Pkg.add("SymbolServer")'
	require'lspconfig'.julials.setup({
      server_path = "/home/chasar/.julia/packages/LanguageServer/jiDTR/src/"
	})
	-- Lua language config
	-- sudo pacman -S lua-language-server
	local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
	local runtime_path = vim.split(package.path, ';')
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	require'lspconfig'.sumneko_lua.setup {
		cmd = {"/usr/bin/lua-language-server", "-E", sumneko_root_path .. "/main.lua"};
		settings = {
			Lua = {
				runtime = {
        			-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT',
        			-- Setup your lua path
					path = runtime_path,
      			},
			diagnostics = {
        -- Get the language server to recognize the `vim` global
        		globals = {'vim'},
      		},
      workspace = {
        -- Make the server aware of Neovim runtime files
		library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
		enable = false,
		},
		},
		},
	}
	-- sudo pacman -S bash-language-server
	require'lspconfig'.bashls.setup{}
	-- sudo pacman -S rust-analyzer
	require'lspconfig'.rust_analyzer.setup{}
	-- sudo pacman -S texlab
	require'lspconfig'.texlab.setup{}
	-- paru -S java-language-server
	require'lspconfig'.java_language_server.setup{
		cmd = {"/usr/bin/java-language-server"}
	}


-- Compe setup
use 'hrsh7th/nvim-compe'
vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--This line is important for auto-import
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })


use 'windwp/nvim-autopairs'
	require('nvim-autopairs').setup({
		map_cr = true, --  map <CR> on insert mode
  		map_complete = true -- it will auto insert `(` after select function or method item
	})



	use {
  		'hoob3rt/lualine.nvim',
  		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	require 'lualine'.setup {
  		options = {
    	theme = 'ayu_mirage'
		},
  		sections = {
    		lualine_a = {'mode'},
    		lualine_b = {'branch'},
    		lualine_c = {'filename'},
    		lualine_x = {'encoding', 'fileformat', 'filetype'},
			lualine_y = {'progress'},
			lualine_z = {'location'}
  		},
  	}

	if vim.fn.has('termguicolors') then
		vim.opt.termguicolors = true
	end

	-- Sonokai color scheme settings
	use 'sainnhe/sonokai'
	vim.g['sonokai_style']                   = 'andromeda'
	vim.g['sonokai_enable_italic']           = 1
	vim.g['sonokai_disable_itallic_comment'] = 1
	vim.g['airline_theme']                   = 'sonokai'
	vim.cmd 'colorscheme sonokai'
end)
