require('gitsigns').setup {
  signs = {
    add          = { text = '▍', },
    change       = { text = '▍', },
    delete       = { text = '契', },
    topdelete    = { text = '契', },
    changedelete = { text = '▍', },
    untracked    = { text = '▍', },
  },
  signs_staged_enable = false,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']g', function()
      if vim.wo.diff then return ']g' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[g', function()
      if vim.wo.diff then return '[g' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>gs', ':Gitsigns stage_hunk<CR>', { silent = true })
    -- map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    -- map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>gu', gs.undo_stage_hunk)
    -- map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>gg', gs.preview_hunk)
    map('n', '<leader>gb', function() gs.blame_line{full=true} end)
    -- map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>gd', gs.diffthis)
    -- map('n', '<leader>hD', function() gs.diffthis('~') end)
    -- map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
