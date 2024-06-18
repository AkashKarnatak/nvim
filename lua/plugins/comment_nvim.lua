local ft = require('Comment.ft')
ft.set('asm', {'//%s', '/*%s*/'})
ft.set('resolv', '#%s')
ft.set('pfmain', '#%s')

vim.g.skip_ts_context_commentstring_module = true
require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

require('Comment').setup({
  toggler = {
    line = 'cmm',
  },
  opleader = {
    line = 'cm',
  },
  extra = {
    above = 'cmO',
    below = 'cmo',
    eol = 'cmA',
  },
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
})
