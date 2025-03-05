return {
  on_attach = require("plugins.lsp.handlers").on_attach,
  capabilities = require("plugins.lsp.handlers").capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  init_options = {
    fallbackFlags = {
      "-I/home/akash/miniconda3/envs/playground/targets/x86_64-linux/include",
      "-I/home/akash/miniconda3/envs/playground/lib/python3.10/site-packages/torch/include",
      "--cuda-gpu-arch=sm_86",
    },
  },
}
