-- Python
--sudo pacman -S pyright
local M = {}

function M.setup(on_attach)
	local lsp = require 'lspconfig'
	lsp.pyright.setup{ on_attach = on_attach }
end

return M
