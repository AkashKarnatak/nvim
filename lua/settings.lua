vim.o.hidden = true                                      -- Required to keep multiple buffers open multiple buffers
vim.wo.wrap = false                                      -- Display long lines as just one line
vim.o.pumheight = 10                                     -- Makes popup menu smaller
vim.o.fileencoding = "utf-8"                             -- The encoding written to file
vim.o.mouse = "a"                                        -- Enable your mouse
vim.o.splitbelow = true                                  -- Horizontal splits will automatically be below
vim.o.splitright = true                                  -- Vertical splits will automatically be to the right
vim.o.termguicolors = true                               -- set term giu colors most terminals support this
vim.o.t_Co = "256"                                       -- Support 256 colors
vim.bo.expandtab = true                                  -- Converts tabs to spaces
vim.bo.smartindent = true                                -- Makes indenting smart
vim.wo.number = true                                     -- set numbered lines
vim.wo.relativenumber = true                             -- set relative number
vim.wo.cursorline = true                                 -- Enable highlighting of the current line
vim.o.clipboard = "unnamedplus"                          -- Copy paste between vim and everything else
vim.o.showtabline = 2                                    -- Always show tabs
vim.wo.signcolumn = "yes"                                -- Always show the signcolumn, otherwise it would shift the text each time
-- vim.o.updatetime = 200                                -- Faster completion
vim.o.timeoutlen = 500                                   -- By default timeoutlen is 1000 ms
vim.o.cpoptions = vim.o.cpoptions .. 'y'                 -- Allows yank action to be repeated
vim.cmd('set ts=2')                                      -- Insert 4 spaces for a tab
vim.cmd('set sw=2')                                      -- Change the number of space characters inserted for indentation
vim.cmd('syntax on')                                     -- Enable syntax highlighting
vim.cmd('command! BD silent! execute "%bd|e#|bd#"')      -- Close all buffers except the active one

-- Jump cursor to the line where last exited nvim
vim.cmd([[ autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif ]])
