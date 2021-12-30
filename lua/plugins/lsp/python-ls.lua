-- require'lspconfig'.pyright.setup{}
  -- on_attach = function(_, bufnr)
  --   require'plugins.lsp'.on_attach(_, bufnr)
  -- end
-- }

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require'lspconfig'.pyright.setup{
  on_attach = function(_, bufnr)
    require'plugins.lsp'.on_attach(_, bufnr)
  end,
  capabilities = capabilities
}

