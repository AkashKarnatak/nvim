require'lspconfig'.clangd.setup{
  on_attach = function(_, bufnr)
    require'completion'.on_attach()
    require'lsp'.on_attach(_, bufnr)
  end
}
