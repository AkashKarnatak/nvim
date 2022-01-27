local nvim_lsp = require "lspconfig"
-- require "user.lsp.lsp-installer"
require("plugins.lsp.handlers").setup()
require "plugins.lsp.null-ls"

-- list of all servers
local servers = {
  'clangd',
  'pyright',
  'tsserver',
  'racket_langserver',
  'cssls',
  'html'
}

local opts = {
  on_attach = require("plugins.lsp.handlers").on_attach,
  capabilities = require("plugins.lsp.handlers").capabilities
}

for _, server_name in ipairs(servers) do
  if server_name == "sumneko_lua" then
    local sumneko_opts = require("plugins.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	elseif server_name == "sumneko_lua" then
    local sumneko_opts = require("plugins.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end
  nvim_lsp[server_name].setup(opts)
end
