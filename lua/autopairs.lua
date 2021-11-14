require('nvim-autopairs').setup()

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = false,  -- auto select first item
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})

vim.g.autopairs_active = true
function _G.ToggleAutoPairs()
  if vim.g.autopairs_active then
    vim.g.autopairs_active = false
    require('nvim-autopairs').disable()
		print('AutoPairs turned off')
  else
    vim.g.autopairs_active = true
    require('nvim-autopairs').enable()
		print('AutoPairs turned on')
  end
end

vim.api.nvim_set_keymap('n', '<leader>pp', ':call v:lua.ToggleAutoPairs()<CR>', {noremap = true, silent = true})
