require'nvim-treesitter.configs'.setup {
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
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["aj"] = "@conditional.outer",
        ["ij"] = "@conditional.inner",
        ["as"] = "@statement.outer",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
        ["ia"] = "@parameter.inner",
        ["aa"] = "@parameter.outer",

        
        -- ["ib"] = "@call.inner",
        -- ["ab"] = "@call.outer",

        -- ["ib"] = "@class.inner",
        -- ["ab"] = "@class.outer",

        -- ["ab"] = "@comment.outer",

        -- ["ib"] = "@conditional.inner",
        -- ["ab"] = "@conditional.outer",

        -- ["ib"] = "@frame.inner",
        -- ["ab"] = "@frame.outer",

        -- ["ib"] = "@function.inner",
        -- ["ab"] = "@function.outer",

        -- ["ib"] = "@loop.inner",
        -- ["ab"] = "@loop.outer",

        -- ["ib"] = "@parameter.inner",
        -- ["ab"] = "@parameter.outer",

        -- ["ib"] = "@scopename.inner",
        -- ["ab"] = "@statement.outer",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },

      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>t"] = "@parameter.outer",
      },
      swap_previous = {
        ["<leader>T"] = "@parameter.outer",
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
    -- lsp_interop = {
    --   enable = true,
    --   border = 'rounded',
    --   peek_definition_code = {
    --     ["df"] = "@function.outer",
    --     ["dF"] = "@class.outer",
    --   },
    -- },
  },
}
