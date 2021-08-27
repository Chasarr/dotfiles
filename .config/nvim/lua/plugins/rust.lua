-- Rust
--sudo pacman -S rust-analyzer
local M = {}

function M.setup(on_attach)
	local lsp = require 'lspconfig'
	lsp.rust_analyzer.setup{ on_attach = on_attach }
end
return M
