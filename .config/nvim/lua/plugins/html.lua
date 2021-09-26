-- HTML
-- sudo npm i -g vscode-langservers-extracted
local M = {}
function M.setup(on_attach)
	--Enable (broadcasting) snippet capability for HTML completion
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local lsp = require 'lspconfig'
	lsp.html.setup {
  		capabilities = capabilities,
		on_attach = on_attach
	}

end

return M
