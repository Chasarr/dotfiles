-- Bash
--sudo pacman -S bash-language-server
local lsp = require 'lspconfig'
lsp.bashls.setup{}
