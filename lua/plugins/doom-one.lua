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

-- NvimTree
vim.cmd('highlight! LspHighlight guibg=#274873')
vim.cmd('highlight! NvimTreeNormal guibg=#24282e')
vim.cmd('highlight! NvimTreeNormalNC guibg=#24282e')
vim.cmd('highlight! NvimTreeEndOfBuffer guifg=#24282e guibg=#24282e')
vim.cmd('highlight! NvimTreeVertSplit guifg=#24282e guibg=#24282e')
vim.cmd('highlight! NvimTreeStatuslineNc guifg=#24282e guibg=#24282e')
vim.cmd('highlight! NvimTreeLspDiagnosticsError guibg=NONE guifg=#ff6c6b')
vim.cmd('highlight! NvmTreeLspDiagnosticsWarning guibg=NONE guifg=#ff0000')
vim.cmd('highlight! NvimTreeLspDiagnosticsInformation guibg=NONE guifg=#51afef')
vim.cmd('highlight! NvimTreeLspDiagnosticsHint guibg=NONE guifg=#98be65')
