require'lsp'.set_keybindings()
require'lspconfig'.pyright.setup{
  on_attach = require'completion'.on_attach
}
