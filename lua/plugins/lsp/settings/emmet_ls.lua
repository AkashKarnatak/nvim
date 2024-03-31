return {
  on_attach = require("plugins.lsp.handlers").on_attach,
  capabilities = require("plugins.lsp.handlers").capabilities,
  filetypes = {
    "astro",
    "css",
    "ejs",
    "eruby",
    "html",
    "htmldjango",
    "javascriptreact",
    "less",
    "pug",
    "sass",
    "scss",
    "svelte",
    "typescriptreact",
    "vue"
  }
}
