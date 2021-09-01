-- Scala
--paru coursier
--add alias cs='coursier' to .zshrc
--cs install metals
--~/.local/share/coursier/bin/metals --version
--sudo cs bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --org.scalameta:metals_2.12:<enter-version-here> \
  -- -r bintray:scalacenter/releases \
  -- -r sonatype:snapshots \
  -- -o /usr/local/bin/metals -f
local M = {}
function M.setup(on_attach)
	local lsp = require 'lspconfig'
	lsp.metals.setup{ on_attach = on_attach }
end

return M
