-- Java
--paru -S java-language-server
local M  = {}

function M.setup(on_attach)
	local lsp = require 'lspconfig'
	lsp.java_language_server.setup{
		on_attach = on_attach,
		cmd = {"/usr/bin/java-language-server"}
	}
end

return M
