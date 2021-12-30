local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.clangd.setup{
  on_attach = function(_, bufnr)
    require'plugins.lsp'.on_attach(_, bufnr)
  end,
  capabilities = capabilities
}
