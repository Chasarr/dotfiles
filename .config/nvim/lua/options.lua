local cmd = vim.cmd
local opt = vim.opt
local has = vim.fn.has

vim.g.mapleader = ' '		--sets leader key to space for some reason
opt.ic = true				--ignore case
opt.smartcase = true		--ignores case unless you tube CAPITAL letters
opt.hls = true				--highlights all mathced search results
opt.mouse = 'a'				--enables mouse,. hold shift to copy
opt.nu = true				--line numbers
opt.rnu = true				--relative line number
opt.tabstop = 4				--tab character is 4 spaces wide
opt.shiftwidth = 4			--typing >> makes a 4 space wide tab
opt.scrolloff = 0
opt.termguicolors = true	--true color support
opt.ai = true				--auto indent
--cmd('syntax off')
vim.lsp.set_log_level('debug')

---- Keybindings ----
vim.api.nvim_buf_set_keymap(0, 'n', '<up>', '<C-y>', {})	--better scrolling with arrow keys
vim.api.nvim_buf_set_keymap(0, 'n', '<down>', '<C-e>', {})
vim.api.nvim_set_keymap('n', 'ff', '<cmd>lua require"telescope.builtin".find_files()<cr>', { noremap = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<MiddleMouse>', '<Nop>', {})

vim.api.nvim_buf_set_keymap(0, 'n', '<A-j>', ':m .+1<CR>==', { noremap = true})
vim.api.nvim_buf_set_keymap(0, 'n', '<A-k>', ':m .-2<CR>==', { noremap = true})


-- Telescope keybindings
--TODO: check https://github.com/creativenull/dotfiles/blob/4fc5971029604ff1c338cfe0c6c2c333d9ee3ec4/.config/nvim-nightly/lua/creativenull/plugins/config/telescope.lua#L17
local telescope = require 'telescope'
--Telescope.setup{defaults = {vimgrep_arguments = { 'rg', '--hidden'}};

local find_files = function()
  telescope.builtin.find_files {
    find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
    previewer = false
  }
end
vim.api.nvim_set_keymap('n', 'ff', '<cmd>lua require"telescope.builtin".find_files()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'fg', '<cmd>lua require"telescope.builtin".live_grep()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'fb', '<cmd>lua require"telescope.builtin".buffers()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'fh', '<cmd>lua require"telescope.builtin".help_tags()<cr>', { noremap = true })


require 'plugins.lsp'			--LSP configs
