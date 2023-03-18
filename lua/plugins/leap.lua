require('leap').setup {
  max_phase_one_targets = nil,
  highlight_unlabeled_phase_one_targets = false,
  max_highlighted_traversal_targets = 10,
  case_sensitive = false,
  -- Sets of characters that should match each other.
  -- Obvious candidates are braces and quotes ('([{', ')]}', '`"\'').
  equivalence_classes = { ' \t\r\n', },
  -- Leaving the appropriate list empty effectively disables "smart" mode,
  -- and forces auto-jump to be on or off.
  -- safe_labels = { . . . },
  -- labels = { . . . },
  special_keys = {
    repeat_search  = ';',
    next_phase_one_target = ';',
    next_target    = {';', '<enter>'},
    prev_target    = {',', '<tab>'},
    next_group     = '<space>',
    prev_group     = '<tab>',
    multi_accept = ';',
  },
}

require('leap-spooky').setup {
  affixes = {
    -- These will generate mappings for all native text objects, like:
    -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
    -- Special line objects will also be added, by repeating the affixes.
    -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
    -- window.
    -- You can also use 'rest' & 'move' as mnemonics.
    remote   = { window = 'r', cross_window = 'R' },
    magnetic = { window = 'm', cross_window = 'M' },
  },
  -- If this option is set to true, the yanked text will automatically be pasted
  -- at the cursor position if the unnamed register is in use.
  paste_on_remote_yank = true,
}

-- Mappings
vim.api.nvim_set_keymap('n', 's', '<Plug>(leap-forward-to)', {noremap = true, silent=true})
vim.api.nvim_set_keymap('x', 's', '<Plug>(leap-forward-to)', {noremap = true, silent=true})
vim.api.nvim_set_keymap('o', 's', '<Plug>(leap-forward-to)', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', 'S', '<Plug>(leap-backward-to)', {noremap = true, silent=true})
vim.api.nvim_set_keymap('x', 'S', '<Plug>(leap-backward-to)', {noremap = true, silent=true})
vim.api.nvim_set_keymap('o', 'S', '<Plug>(leap-backward-to)', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', 'gs', '<Plug>(leap-cross-window)', {noremap = true, silent=true})
vim.api.nvim_set_keymap('x', 'gs', '<Plug>(leap-cross-window)', {noremap = true, silent=true})
vim.api.nvim_set_keymap('o', 'gs', '<Plug>(leap-cross-window)', {noremap = true, silent=true})
vim.api.nvim_set_keymap('o', 'gs', '<Plug>(leap-repeat)', {noremap = true, silent=true})
