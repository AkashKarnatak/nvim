vim.o.hidden = true                                             -- Required to keep multiple buffers open multiple buffers
vim.opt.foldenable = false                                      -- Disable code folding
vim.wo.wrap = false                                             -- Display long lines as just one line
vim.o.pumheight = 10                                            -- Makes popup menu smaller
vim.o.fileencoding = "utf-8"                                    -- The encoding written to file
vim.o.mouse = "a"                                               -- Enable your mouse
vim.o.splitbelow = true                                         -- Horizontal splits will automatically be below
vim.o.splitright = true                                         -- Vertical splits will automatically be to the right
vim.o.termguicolors = true                                      -- set term giu colors most terminals support this
vim.o.expandtab = true                                         -- Converts tabs to spaces
vim.o.smartindent = true                                       -- Makes indenting smart
vim.wo.number = true                                            -- set numbered lines
vim.wo.relativenumber = true                                    -- set relative number
vim.wo.cursorline = true                                        -- Enable highlighting of the current line
vim.o.clipboard = "unnamedplus"                                 -- Copy paste between vim and everything else
vim.o.showtabline = 2                                           -- Always show tabs
vim.wo.signcolumn = "yes"                                       -- Always show the signcolumn, otherwise it would shift the text each time
-- vim.o.updatetime = 200                                       -- Faster completion
vim.o.timeoutlen = 500                                          -- By default timeoutlen is 1000 ms
vim.o.cpoptions = vim.o.cpoptions .. 'y'                        -- Allows yank action to be repeated
vim.o.laststatus = 3                                            -- Global statusline
vim.o.ts = 2                                                    -- Insert 4 spaces for a tab
vim.o.sw = 2                                                    -- Change the number of space characters inserted for indentation
vim.cmd('syntax on')                                            -- Enable syntax highlighting
vim.cmd('command! BD silent! execute "%bd|e#|bd#"')             -- Close all buffers except the active one
vim.cmd([[command! FilePath execute "echo expand('%:p')"]])     -- Display absolute path of the file opened in current buffer

-- Jump cursor to the line where last exited nvim
vim.cmd([[autocmd BufReadPre * autocmd FileType <buffer> ++once if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]])
-- Do not add terminal to buffer list
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function() vim.o.buflisted = false end
})
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  callback = function() vim.o.buflisted = false end
})

-- Set cursorline only for active buffers
local filesToIgnr = { NvimTree = true, TelescopePrompt = true, TelescopeResults = true, [""] = true }
local gid = vim.api.nvim_create_augroup("CursorLine", {
  clear = false
})
vim.api.nvim_create_autocmd({"VimEnter", "WinEnter", "BufWinEnter"}, {
  pattern = {"*"},
  group = gid,
  callback = function()
    if not filesToIgnr[vim.o.filetype] then
      vim.o.cursorline = true
    end
  end
})
vim.api.nvim_create_autocmd({"WinLeave"}, {
  pattern = {"*"},
  group = gid,
  callback = function()
    if not filesToIgnr[vim.o.filetype] then
      vim.o.cursorline = false
    end
  end
})
