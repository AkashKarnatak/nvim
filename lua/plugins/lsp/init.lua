local nvim_lsp = require "lspconfig"
require("plugins.lsp.handlers").setup()
require "plugins.lsp.null-ls"

-- Borders for LspInfo winodw
require('lspconfig.ui.windows').default_options.border = 'rounded'

-- list of all servers
local mason_servers = {
  'clangd',
  'ts_ls',
  'cssls',
  'html',
  'emmet_ls',
  'lua_ls',
  'gopls',
  -- 'solc',
  'jsonls',
  'tailwindcss',
  -- 'eslint',
  'sqlls',
}

local servers = {
  'pylance'
}

-- merge
for _, v in ipairs(mason_servers) do
  table.insert(servers, v)
end

-- Installer for LSP servers, DAP, servers, Linters and Formatters
require("plugins.lsp.mason").setup(mason_servers)

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
  tools = {
    inlay_hints = {
      auto = false,
    },
  },
  server = {
    on_attach = require("plugins.lsp.handlers").on_attach,
    capabilities = require("plugins.lsp.handlers").capabilities
  }
})

vim.cmd('highlight! link LspInlayHint Comment')
