local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

if not lspconfig.emmet_ls then
  configs.emmet_ls = {
    default_config = {
      cmd = {'emmet-ls', '--stdio'};
      filetypes = {'html', 'css', 'blade'};
      root_dir = function(_)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end
lspconfig.emmet_ls.setup{
  capabilities = capabilities;
  on_attach = function(_, bufnr)

  -- Configs
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'always'; -- set to 'always' to automatically select the first option
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      -- winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
      -- max_width = 120,
      -- min_width = 60,
      -- max_height = math.floor(vim.o.lines * 0.3),
      -- min_height = 1,
    };

    source = {
      path = true;
      buffer = true;
      tags = true;
      files = true;
      --calc = true;
      nvim_lsp = true;
      nvim_lua = true;
      luasnip = true;
    };
  }

    -- require'plugins.lsp'.on_attach(_, bufnr);
  end
}
