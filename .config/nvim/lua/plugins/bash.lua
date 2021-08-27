-- Bash
--sudo pacman -S bash-language-server
local M = {}

function M.setup(on_attach)
	local lsp = require 'lspconfig'
	lsp.bashls.setup{ on_attach = on_attach }
end

return M
