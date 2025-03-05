vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {"*.ptx"},
  callback = function() vim.o.filetype = "asm" end
})
