-- C
--sudo pacman -S clang
local M = {}
function M.setup(on_attach)
	local lsp = require 'lspconfig'
	lsp.clangd.setup{ on_attach = on_attach }
end

return M
