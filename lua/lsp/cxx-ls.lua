require'lspconfig'.clangd.setup{
  on_attach = function(_, bufnr)
    require'lsp'.on_attach(_, bufnr)
  end
}
