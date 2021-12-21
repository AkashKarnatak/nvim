require'lspconfig'.clangd.setup{
  on_attach = function(_, bufnr)
    require'plugins.lsp'.on_attach(_, bufnr)
  end
}
