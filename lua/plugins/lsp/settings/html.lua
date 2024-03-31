local capabilities = require("plugins.lsp.handlers").capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true
return {
  on_attach = require("plugins.lsp.handlers").on_attach,
  capabilities = capabilities,
  filetypes = { "html", "ejs" }
}
