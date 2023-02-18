vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {"*.dockerignore"},
  callback = function() vim.o.filetype = "dockerignore" end
})
