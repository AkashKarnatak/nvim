vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.launch",
  command = "set filetype=xml"
})
