return {
  on_attach = require("plugins.lsp.handlers").on_attach,
  capabilities = require("plugins.lsp.handlers").capabilities,
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "off"
      }
    }
  }
}
