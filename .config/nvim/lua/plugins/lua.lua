-- Lua
--sudo pacman -S lua-language-server
local M = {}
function M.setup(on_attach)
	local lsp = require 'lspconfig'
	local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
	local runtime_path = vim.split(package.path, ';')
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")
	lsp.sumneko_lua.setup {
		on_attach = on_attach,
		cmd = {"/usr/bin/lua-language-server", "-E", sumneko_root_path .. "/main.lua"};
		settings = {
			Lua = {
				runtime = {
        			-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT',
        			-- Setup your lua path
					path = runtime_path,
      			},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = {'vim'},
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
			},
		},
	}
end
return M
