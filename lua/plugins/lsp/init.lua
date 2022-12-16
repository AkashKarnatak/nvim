local nvim_lsp = require "lspconfig"
local configs = require "lspconfig.configs"
require("plugins.lsp.handlers").setup()
require "plugins.lsp.null-ls"

-- Borders for LspInfo winodw
require('lspconfig.ui.windows').default_options.border = 'rounded'

-- configure servers
if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      cmd = { 'ls_emmet', '--stdio' };
      filetypes = { 'html', 'css', 'scss', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
        'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
      root_dir = function(_)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end

-- list of all servers
local servers = {
  'clangd',
  'pyright',
  'tsserver',
  'racket_langserver',
  'cssls',
  'html',
  'ls_emmet',
  'sumneko_lua',
  'gopls',
  -- 'solc',
  'jsonls',
}

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
  local require_ok, conf_opts = pcall(require, "plugins.lsp.settings" .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end
  nvim_lsp[server].setup(opts)
end

-- Special setup
-- Rust
local rt = require("rust-tools")
rt.setup({
  server = opts
})
