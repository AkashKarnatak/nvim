local nvim_lsp = require "lspconfig"
local configs = require "lspconfig.configs"
require("plugins.lsp.handlers").setup()
require "plugins.lsp.null-ls"

-- Borders for LspInfo winodw
require('lspconfig.ui.windows').default_options.border = 'rounded'

-- list of all servers
local servers = {
  'clangd',
  'pyright',
  'tsserver',
  'cssls',
  'html',
  'emmet_ls',
  'lua_ls',
  'gopls',
  -- 'solc',
  'jsonls',
}

-- Installer for LSP servers, DAP, servers, Linters and Formatters
require("plugins.lsp.mason").setup(servers)

local opts = {
  on_attach = require("plugins.lsp.handlers").on_attach,
  capabilities = require("plugins.lsp.handlers").capabilities
}

local opts = {}

-- Generic lsp servers
for _, server in pairs(servers) do
  opts = {
    on_attach = require("plugins.lsp.handlers").on_attach,
    capabilities = require("plugins.lsp.handlers").capabilities
  }
  server = vim.split(server, "@")[1]
  local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
  if require_ok then
    opts = conf_opts
  end
  nvim_lsp[server].setup(opts)
end

-- Special setup
-- Rust
local rt = require("rust-tools")
rt.setup({
  server = opts
})
