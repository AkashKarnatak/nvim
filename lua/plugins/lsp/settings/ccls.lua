local util = require 'lspconfig/util'
return {
  on_attach = require("plugins.lsp.handlers").on_attach,
  capabilities = require("plugins.lsp.handlers").capabilities,
  root_dir = function(fname)
    return util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname) or util.path.dirname(fname)
  end;
}
