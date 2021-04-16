-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noinsert"

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.g.completion_enable_snippet = 'Neosnippet'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_matching_smart_case = 1
vim.g.completion_trigger_on_delete = 1
vim.g.completion_sorting = "alphabet"
vim.g.completion_auto_change_source = 1
-- vim.g.completion_trigger_keyword_length=10000
-- vim.g.completion_enable_auto_popup = 0
-- vim.g.completion_enable_auto_hover = 0
-- vim.g.completion_enable_auto_signature = 0

vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'lsp', 'snippet' } },
    { complete_items = { 'path' } },
    { mode = '<c-p>' },
    { mode = '<c-n>' },
  }
}

vim.api.nvim_set_keymap('i', '<C-Space>', '<Plug>(completion_trigger)', {silent = true})
vim.cmd([[autocmd BufEnter * lua require'completion'.on_attach()]])
