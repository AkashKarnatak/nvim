local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup {
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "flex",
    layout_config = {
      horizontal = {
        mirror = false,
        prompt_position = "top",
        preview_cutoff = 100,
        preview_width = 0.5,
      },
      vertical = {
        mirror = true,
        prompt_position = "top",
      },
    },
    mappings = {
      i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<esc>"] = actions.close,
          -- [";;"] = actions.close,
      },
      n = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          [";;"] = actions.close,
      }
    }
  }
}

-- Mappings
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fr', ':Telescope file_browser<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fc', ':Telescope current_buffer_fuzzy_find<CR>', {noremap = true, silent = true})

-- Highlightings
vim.cmd([[highlight TelescopeSelection      guibg=#383A42 gui=bold]]) -- selected item
vim.cmd([[highlight TelescopeSelectionCaret guifg=#D79921]])          -- selection caret
vim.cmd([[highlight TelescopeMatching       guifg=#D79921]])          -- matched characters
