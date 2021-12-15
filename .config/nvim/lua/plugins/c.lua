-- C
--sudo pacman -S clang
local M = {}
function M.setup(on_attach)
	local lsp = require 'lspconfig'
	--lsp.clangd.setup{ on_attach = on_attach }
	lsp.ccls.setup {
		on_attach = on_attach,
		init_options = {
    		compilationDatabaseDirectory = "build";
    		index = {
      			threads = 0;
    		};
    		clang = {
      			excludeArgs = { "-frounding-math"} ;
    		};
		}
	}
end

return M
