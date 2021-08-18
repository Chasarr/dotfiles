require 'plugins'
local cmd = vim.cmd			-- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn			-- to call Vim functions e.g. fn.bufnr()
local g = vim.g				-- a table to access global variables
local opt = vim.opt  		-- to set options
local map = vim.api.nvim_set_keymap

vim.g.mapleader = ','		--sets leader key to space for some reason
opt.ic = true				--ignore case
opt.smartcase = true		--ignores case unless you tube CAPITAL letters
opt.hls = true				--highlights all mathced search results
opt.mouse = 'a'				--enables mouse,. hold shift to copy
opt.number = true			--line numbers
opt.rnu = true				--relative line number
opt.tabstop = 4				--tab character is 4 spaces wide
opt.shiftwidth = 4			--typing >> makes a 4 space wide tab
opt.scrolloff = 4
opt.termguicolors = true	--true color support
opt.ai = true				--auto indent
----Graphical----
--require('nord').set()
--g.colors_name = 'dracula'
--g.nord_disable_background = true	--transparent background



----Plugin settings----
--require('lualine').setup()
--Telescope hotkeys
map('n', 'ff', '<cmd>lua require"telescope.builtin".find_files()<cr>', { noremap = true })
map('n', 'fg', '<cmd>lua require"telescope.builtin".live_grep()<cr>', { noremap = true })
map('n', 'fb', '<cmd>lua require"telescope.builtin".buffers()<cr>', { noremap = true })
map('n', 'fh', '<cmd>lua require"telescope.builtin".help_tags()<cr>', { noremap = true })

