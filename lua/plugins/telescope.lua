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
          -- ["<esc>"] = actions.close,
          -- [";;"] = actions.close,
      },
      n = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<esc>"] = actions.close,
      }
    },
    file_ignore_patterns = { "node_modules" }
  }
}

require('telescope').load_extension('projects')

-- Mappings
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files no_ignore=true<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fo', ':Telescope oldfiles no_ignore=true<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fw', ':Telescope live_grep no_ignore=true<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fm', ':Telescope marks no_ignore=true<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>f/', ':Telescope current_buffer_fuzzy_find<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fc', [[:Telescope find_files no_ignore=true prompt_title=Nvim\ Config cwd=$HOME/.config/nvim<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope git_status no_ignore=true<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope highlights no_ignore=true<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gd", ":Telescope lsp_definitions<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gi", ":Telescope lsp_implementations<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>ld", ":Telescope diagnostics<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>ls", ":Telescope lsp_document_symbols<CR>", {noremap = true, silent = true})

-- Highlightings
vim.cmd([[highlight TelescopeSelection      guibg=#383A42 gui=bold]]) -- selected item
vim.cmd([[highlight TelescopeSelectionCaret guifg=#D79921]])          -- selection caret
vim.cmd([[highlight TelescopeMatching       guifg=#D79921]])          -- matched characters
