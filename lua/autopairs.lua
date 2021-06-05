require('nvim-autopairs').setup()

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils= {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end

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

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
vim.api.nvim_set_keymap('n', '<leader>pp', ':call v:lua.ToggleAutoPairs()<CR>', {noremap = true, silent = true})
