vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {"*.gohtml"},
  callback = function() vim.o.filetype = "html" end
})
