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


---- Keybindings ----
vim.api.nvim_buf_set_keymap(0, 'n', '<up>', '<C-y>', {})	--better scrolling with arrow keys
vim.api.nvim_buf_set_keymap(0, 'n', '<down>', '<C-e>', {})
vim.api.nvim_set_keymap('n', 'ff', '<cmd>lua require"telescope.builtin".find_files()<cr>', { noremap = true })

-- Telescope keybindings
vim.api.nvim_set_keymap('n', 'ff', '<cmd>lua require"telescope.builtin".find_files()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'fg', '<cmd>lua require"telescope.builtin".live_grep()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'fb', '<cmd>lua require"telescope.builtin".buffers()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'fh', '<cmd>lua require"telescope.builtin".help_tags()<cr>', { noremap = true })
