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
    gitsigns = true,
    telescope = true,
    neogit = false,
    nvim_tree = true,
    dashboard = true,
    startify = false,
    whichkey = false,
    indent_blankline = false,
    vim_illuminate = false,
    lspsaga = false,
  },
})

-- General
vim.cmd('highlight! PmenuSbar guibg=#404652')
vim.cmd('highlight! FloatBorder guifg=#5b6268 guibg=#21252a')
vim.cmd('highlight! TermCursor cterm=reverse gui=reverse guifg=#51afef')

-- Diagnostic
vim.cmd('highlight! link DiagnosticError DiagnosticFloatingError')
vim.cmd('highlight! link DiagnosticHint DiagnosticFloatingHint')
vim.cmd('highlight! link DiagnosticInfo DiagnosticFloatingInfo')
vim.cmd('highlight! link DiagnosticWarn DiagnosticFloatingWarn')
vim.cmd('highlight! link DiagnosticSignInfo DiagnosticFloatingInfo')
vim.cmd('highlight! link DiagnosticSignWarn DiagnosticFloatingWarn')

-- NvimTree
vim.cmd('highlight! LspHighlight guibg=#274873')
vim.cmd('highlight! NvimTreeNormal guibg=#24282e')
vim.cmd('highlight! NvimTreeNormalNC guibg=#24282e')
vim.cmd('highlight! NvimTreeEndOfBuffer guifg=#24282e guibg=#24282e')
vim.cmd('highlight! NvimTreeVertSplit guifg=#24282e guibg=#24282e')
vim.cmd('highlight! NvimTreeStatuslineNc guifg=#24282e guibg=#24282e')
vim.cmd('highlight! NvimTreeCursorLine guibg=#1d2125 gui=bold')

-- -- Bufferline
vim.cmd('highlight! BufferLineRightCustomArea guifg=#76cce0 guibg=#1c1f24 gui=bold')
vim.cmd('highlight! BufferLineRightCustomAreaText1 guifg=#76cce0 guibg=#1c1f24 gui=bold')

local hlmap = vim.treesitter.highlighter.hl_map
hlmap.error = nil
