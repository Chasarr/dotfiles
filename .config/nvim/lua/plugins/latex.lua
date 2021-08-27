-- LaTeX
--sudo pacman -S texlab
local M = {}

function M.setup(on_attach)
	local lsp = require 'lspconfig'
	lsp.texlab.setup{ on_attach = on_attach }
end

return M
