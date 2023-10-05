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
vim.wo.cursorline = false                                       -- Enable highlighting of the current line
vim.o.clipboard = "unnamedplus"                                 -- Copy paste between vim and everything else
vim.o.showtabline = 2                                           -- Always show tabs
vim.wo.signcolumn = "yes"                                       -- Always show the signcolumn, otherwise it would shift the text each time
-- vim.o.updatetime = 200                                       -- Faster completion
vim.o.timeoutlen = 500                                          -- By default timeoutlen is 1000 ms
vim.o.cpoptions = vim.o.cpoptions .. 'y'                        -- Allows yank action to be repeated
vim.o.laststatus = 3                                            -- Global statusline
vim.o.ts = 2                                                    -- Insert 4 spaces for a tab
vim.o.sw = 2                                                    -- Change the number of space characters inserted for indentation
vim.cmd('command! BD silent! execute "%bd|e#|bd#"')             -- Close all buffers except the active one
vim.cmd([[command! FilePath execute "echo expand('%:p')"]])     -- Display absolute path of the file opened in current buffer

-- Command to format buffer
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({async = true})' ]]

-- HTML related settings (:h html-indent)
vim.g.html_indent_inctags = "p"
vim.g.html_indent_script1 = "inc"
vim.g.html_indent_style1 = "inc"

-- Jump cursor to the line where last exited nvim
vim.cmd([[autocmd BufReadPre * autocmd FileType <buffer> ++once if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]])
-- -- Avoid scrolling when switch buffers
-- vim.cmd([[au BufLeave * if !&diff | let b:winview = winsaveview() | endif]])
-- vim.cmd([[au BufEnter * if exists('b:winview') && !&diff | call   winrestview(b:winview) | endif]])
vim.cmd([[
" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction
" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction
" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif
]])
-- Prioritize linux man pages over posix
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function() vim.b.man_default_sects = '2,3' end
})
-- Do not add terminal to buffer list
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.o.buflisted = false
    vim.cmd([[set winhighlight=Normal:NormalFloat]])
  end
})
vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    if vim.o.filetype == "qf" then
      vim.o.buflisted = false
      vim.cmd([[set winhighlight=Normal:NormalFloat]])
    end
  end
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank({higroup="Visual", timeout=150}) end
})

-- Turn off plugins some plugins when opening large files
local aug = vim.api.nvim_create_augroup("buf_large", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  callback = function()
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
    if ok and stats and (stats.size > 100000) then
      vim.b.large_buf = true
      vim.cmd("syntax on")
      vim.cmd("IlluminatePauseBuf") -- disable vim-illuminate
      vim.cmd("IBLDisable") -- disable indent-blankline.nvim
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.spell = false
    else
      vim.b.large_buf = false
    end
  end,
  group = aug,
  pattern = "*",
})
