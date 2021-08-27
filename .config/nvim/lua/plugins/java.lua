-- Java
--paru -S java-language-server
local lsp = require 'lspconfig'
lsp.java_language_server.setup{
	cmd = {"/usr/bin/java-language-server"}
}

