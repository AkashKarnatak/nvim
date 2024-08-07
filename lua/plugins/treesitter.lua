local nvim_treesitter_configs = require('nvim-treesitter.configs')
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.embedded_template = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
    files = {"src/parser.c"},
    requires_generate_from_grammar = false,
  },
}

vim.treesitter.language.register('embedded_template', 'ejs')

nvim_treesitter_configs.setup {
  ensure_installed = "all",                                -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "comment", "javascript", "graphql", "wing" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,                                         -- false will disable the whole extension
    disable = function(lang)
      return lang == "html" or vim.b.large_buf
    end,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {
      "python",
      "html",
      "rust",
    }
  },
  autopairs = {
    enable = true
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["ii"] = "@conditional.if",
        ["iI"] = "@conditional.else",
        ["ai"] = "@conditional.outer",
      },
      include_surrounding_whitespace = true,
    },
    swap = {
      enable = true,
      swap_next = {
        ["<space>js"] = "@parameter.inner",
      },
      swap_previous = {
        ["<space>jS"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'rounded',
      peek_definition_code = {
        ["<space>jf"] = "@function.outer",
        ["<space>jF"] = "@class.outer",
      },
    },
  },
}
