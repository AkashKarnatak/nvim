require('nvim-autopairs').setup()

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

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
