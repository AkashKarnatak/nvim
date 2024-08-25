local actions = require('telescope.actions')
local fb_actions = require "telescope".extensions.file_browser.actions
-- Global remapping
local max_size = 100000
local truncate_large_files = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > max_size then
      local cmd = {"head", "-c", max_size, filepath}
      require('telescope.previewers.utils').job_maker(cmd, bufnr, opts)
    else
      require('telescope.previewers').buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end
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
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-uu' -- no_ignore=true and hidden=true
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
    file_ignore_patterns = { "node_modules/", "dist/", ".git/" },
    buffer_previewer_maker = truncate_large_files,
  },
  extensions = {
    file_browser = {
      mappings = {
        ["n"] = {
          ["<BS>"] = fb_actions.goto_parent_dir
        }
      },
    },
  }
}

-- Mappings
-- NOTE: if you want to search for gitignored file as well then add additional option to find_files "no_ignore=true"
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files hidden=true<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fo', ':Telescope oldfiles hidden=true<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fw', ':Telescope live_grep<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fm', ':Telescope marks<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>f/', ':Telescope current_buffer_fuzzy_find<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fc', [[:Telescope find_files hidden=true prompt_title=Nvim\ Config cwd=$HOME/.config/nvim<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope git_status<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope highlights', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fp', ':Telescope projects hidden=true<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fr', ':Telescope resume<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fe', ':Telescope file_browser<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gd", ":Telescope lsp_definitions<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gi", ":Telescope lsp_implementations<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>ld", ":Telescope diagnostics<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>ls", ":Telescope lsp_document_symbols<CR>", {noremap = true, silent = true})

-- Highlightings
vim.cmd([[highlight TelescopeSelection      guibg=#383A42 gui=bold]]) -- selected item
vim.cmd([[highlight TelescopeSelectionCaret guifg=#D79921]])          -- selection caret
vim.cmd([[highlight TelescopeMatching       guifg=#D79921]])          -- matched characters

-- Extensions
require("telescope").load_extension "file_browser"
