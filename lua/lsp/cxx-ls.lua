require'lsp'.set_keybindings()
require'lspconfig'.clangd.setup{
  on_attach = require'completion'.on_attach
}
