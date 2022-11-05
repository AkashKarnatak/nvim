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

-- Generic lsp servers
for _, server_name in ipairs(servers) do
  if server_name == "sumneko_lua" then
    local sumneko_opts = require("plugins.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end
  if server_name == "cssls" or server_name == "html" then
    opts = require("plugins.lsp.settings.vscode-langservers-extracted")
  end
  nvim_lsp[server_name].setup(opts)
end

-- Special setup
-- Rust
local rt = require("rust-tools")
rt.setup({
  server = opts
})
