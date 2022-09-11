local util = require 'lspconfig/util'
return {
  root_dir = function(fname)
    return util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname) or util.path.dirname(fname)
  end;
}
