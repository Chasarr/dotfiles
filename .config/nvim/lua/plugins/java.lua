-- Java
--paru -S java-language-server
local M  = {}

function M.setup(on_attach)
	local lsp = require 'lspconfig'
	lsp.java_language_server.setup{
		on_attach = on_attach,
		cmd = {"/usr/share/java/java-language-server/lang_server_linux.sh"}
	}
end

return M
