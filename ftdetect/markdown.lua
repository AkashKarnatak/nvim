vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.md" },
  callback = function()
    vim.opt.conceallevel = 2
    vim.opt.concealcursor = 'nc'
  end
})
