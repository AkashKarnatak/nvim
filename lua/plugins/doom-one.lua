require('doom-one').setup({
  cursor_coloring = true,
  terminal_colors = false,
  italic_comments = true,
  enable_treesitter = true,
  transparent_background = false,
  pumblend = {
    enable = false,
    transparency_amount = 20,
  },
  plugins_integrations = {
    neorg = false,
    barbar = false,
    bufferline = true,
    gitgutter = false,
    gitsigns = false,
    telescope = true,
    neogit = false,
    nvim_tree = true,
    dashboard = false,
    startify = false,
    whichkey = false,
    indent_blankline = true,
    vim_illuminate = false,
    lspsaga = false,
  },
})

-- General
vim.cmd('highlight! PmenuSbar guibg=#404652')
vim.cmd('highlight! link NormalFloat Normal')
vim.cmd('highlight! FloatBorder guifg=#51afef guibg=#282c34')
vim.cmd('highlight! TermCursor cterm=reverse gui=reverse guifg=#51afef')

-- Diagnostic
vim.cmd('highlight! link DiagnosticError DiagnosticFloatingError')
vim.cmd('highlight! link DiagnosticHint DiagnosticFloatingHint')
vim.cmd('highlight! link DiagnosticInfo DiagnosticFloatingInfo')
vim.cmd('highlight! link DiagnosticWarn DiagnosticFloatingWarn')
vim.cmd('highlight! link DiagnosticSignInfo DiagnosticFloatingInfo')
vim.cmd('highlight! link DiagnosticSignWarn DiagnosticFloatingWarn')

-- NvimTree
vim.cmd('highlight! Visual guibg=#353d4e')
vim.cmd('highlight! PmenuSel guifg=NONE guibg=#353d4e')
-- vim.cmd('highlight! CursorLine guifg=NONE guibg=#2f3541')
-- vim.cmd('highlight! CursorLineNr guifg=NONE guibg=#2f3541')
vim.cmd('highlight! LspHighlight guibg=#274873')
vim.cmd('highlight! NvimTreeNormal guibg=#24282e')
vim.cmd('highlight! NvimTreeNormalNC guibg=#24282e')
vim.cmd('highlight! NvimTreeEndOfBuffer guifg=#24282e guibg=#24282e')
vim.cmd('highlight! NvimTreeVertSplit guifg=#24282e guibg=#24282e')
-- vim.cmd('highlight! NvimTreeWinSeperator guifg=#24282e guibg=#24282e')

-- vim.cmd('highlight! NvimTreeVertSplit guifg=#3f444a guibg=#24282e')
-- vim.opt.fillchars:append('vert:▕')
-- vim.opt.fillchars:append('vertright:▕')

vim.cmd('highlight! NvimTreeStatuslineNc guifg=#24282e guibg=#24282e')
vim.cmd('highlight! NvimTreeCursorLine guibg=#1d2125 gui=bold')

-- Bufferline
vim.cmd('highlight! BufferLineRightCustomArea guifg=#76cce0 guibg=#1c1f24 gui=bold')
vim.cmd('highlight! BufferLineRightCustomAreaText1 guifg=#76cce0 guibg=#1c1f24 gui=bold')

-- GitSigns
vim.cmd('highlight! link GitSignsAdd DiffAddedGutter')
vim.cmd('highlight! link GitSignsChange DiffModifiedGutter')
vim.cmd('highlight! link GitSignsDelete DiffRemovedGutter')
vim.cmd('highlight! link GitSignsAddLn DiffAdd')
vim.cmd('highlight! link GitSignsAddInline DiffAdd')
vim.cmd('highlight! link GitSignsChangeLn DiffChange')
vim.cmd('highlight! link GitSignsChangeInline DiffChange')
vim.cmd('highlight! link GitSignsDeleteLn DiffDelete')
vim.cmd('highlight! link GitSignsDeleteInline DiffDelete')

-- Indent blankline
vim.cmd [[highlight! IndentBlanklineContextChar guifg=#6d7580 gui=bold]]

local hlmap = vim.treesitter.highlighter.hl_map
hlmap.error = nil
