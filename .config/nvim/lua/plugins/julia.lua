-- Julia
--sudo pacman -S lua-language-server
--julia -e 'using Pkg; Pkg.add("LanguageServer"); Pkg.add("SymbolServer")'
--to update, run julia -e 'using Pkg; Pkg.update()'
local lsp = require 'lspconfig'
lsp.julials.setup({
	server_path = "/home/chasar/.julia/packages/LanguageServer/jiDTR/src/"
})
