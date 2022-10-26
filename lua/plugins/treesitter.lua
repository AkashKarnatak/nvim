local nvim_treesitter_configs = require('nvim-treesitter.configs')
nvim_treesitter_configs.setup {
  -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "html", "markdown", "help" },  -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = {
      "c",
      "cpp",
      "yaml",
      "lua",
      "python",
      "java",
      "html",
      "css",
      "javascript",
      "go",
      "norg",
      "markdown",
    }
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
  autopairs = {
    enable = true
  },
  autotag = {
    enable = true,
    disable = { "markdown" },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  textobjects = {
    select = {
      enable = true,
      disable = { "markdown" },

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
      disable = { "markdown" },
      swap_next = {
        ["<space>js"] = "@parameter.inner",
      },
      swap_previous = {
        ["<space>jS"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      disable = { "markdown" },
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
      disable = { "markdown" },
      border = 'rounded',
      peek_definition_code = {
        ["<space>jf"] = "@function.outer",
        ["<space>jF"] = "@class.outer",
      },
    },
  },
}
