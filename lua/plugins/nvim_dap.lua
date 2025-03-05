local dap, dapui = require('dap'), require("dapui")

-- DapUI config
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
-- dap.listeners.before.event_terminated.dapui_config = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
--   dapui.close()
-- end

dapui.setup({
  floating = {
    border = "rounded"
  }
})
vim.api.nvim_create_user_command("DapToggle", function()
  dapui.toggle()
end, { nargs = 0 })

-- Python dap config
local conda_env = os.getenv("CONDA_PREFIX")
local venv = os.getenv("VIRTUAL_ENV")
dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = "executable",
      command = (vim.fn.executable(string.format("%s/bin/python", conda_env)) == 1
          and string.format("%s/bin/python", conda_env))
          or (vim.fn.executable(string.format("%s/bin/python", venv)) == 1
          and string.format("%s/bin/python", venv))
          or "/usr/bin/python",
      args = { "-m", "debugpy.adapter" },
      options = {
        source_filetype = "python",
      },
		})
  end
end

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      if vim.fn.executable(string.format("%s/bin/python",venv)) == 1 then
        return venv .. '/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

-- C/C++/Rust dap config
dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-dap", -- adjust as needed, must be absolute path
  name = "lldb",
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    stopOnEntry = false,
    args = function()
      return vim.split(vim.fn.input('Additional args: '), " ")
    end,
    justMyCode = false,

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}
-- dap.adapters.codelldb = {
--   type = 'server',
--   port = "${port}",
--   executable = {
--     -- CHANGE THIS to your path!
--     command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
--     args = {"--port", "${port}"},
--
--     -- On windows you may have to uncomment this:
--     -- detached = false,
--   }
-- }
-- dap.configurations.cpp = {
--   {
--     name = "Launch file",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     args = function()
--       return vim.split(vim.fn.input('Additional args: '), " ")
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--   },
-- }
-- dap.adapters.gdb = {
--   type = "executable",
--   command = "gdb",
--   args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
-- }
-- dap.configurations.cpp = {
--   {
--     name = "Launch",
--     type = "gdb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     -- args = { "--help" },
--     args = function()
--       return vim.split(vim.fn.input('Additional args: '), " ")
--     end,
--     cwd = "${workspaceFolder}",
--     stopAtBeginningOfMainSubprogram = false,
--   },
--   {
--     name = "Select and attach to process",
--     type = "gdb",
--     request = "attach",
--     program = function()
--        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     pid = function()
--        local name = vim.fn.input('Executable name (filter): ')
--        return require("dap.utils").pick_process({ filter = name })
--     end,
--     cwd = '${workspaceFolder}'
--   },
--   {
--     name = 'Attach to gdbserver :1234',
--     type = 'gdb',
--     request = 'attach',
--     target = 'localhost:1234',
--     program = function()
--        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}'
--   },
-- }
dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

vim.fn.sign_define("DapBreakpoint", { text = "●", numhl = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DapBreakpointCondition", { text = "≖", numhl = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DapLogPoint", { text = "◆", numhl = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DapStopped", { text = "", numhl = "", texthl = "DiagnosticSignHint" })
vim.fn.sign_define("DapBreakpointRejected", { text = "●", numhl = "", texthl = "DiagnosticSignInfo" })

-- Shortcuts
vim.api.nvim_set_keymap('n', '<M-c>', [[:lua require'dap'.continue()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-n>', [[:lua require'dap'.step_over()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-i>', [[:lua require'dap'.step_into()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-o>', [[:lua require'dap'.step_out()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-x>', [[:lua require'dap'.toggle_breakpoint()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dc', [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dl', [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-r>', [[:lua require'dap'.repl.open()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-t>', [[:lua require'dap'.terminate()<CR>:lua require'dap'.close()<CR>]], {noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<M-c>', [[<cmd>lua require'dap'.continue()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<M-n>', [[<cmd>lua require'dap'.step_over()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<M-i>', [[<cmd>lua require'dap'.step_into()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<M-o>', [[<cmd>lua require'dap'.step_out()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<M-x>', [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<M-r>', [[<cmd>lua require'dap'.repl.open()<CR>]], {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>ds', [[<cmd>lua require'dapui'.float_element('scopes', {enter = true})<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dt', [[<cmd>lua require'dapui'.float_element('stacks', {enter = true})<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dw', [[<cmd>lua require'dapui'.float_element('watches', {enter = true})<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>db', [[<cmd>lua require'dapui'.float_element('breakpoints', {enter = true})<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dr', [[<cmd>lua require'dapui'.float_element('repl', {enter = true})<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-e>', [[<cmd>lua require("dapui").eval()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<M-e>', [[<cmd>lua require("dapui").eval()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>de', [[<cmd>lua require("dapui").eval(vim.fn.input('Enter expression: '))<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dd', [[:lua require'dapui'.toggle()<CR>]], {noremap = true, silent = true})

-- Autocommands
vim.cmd([[ autocmd FileType dap-repl set nobuflisted]])
vim.cmd([[ autocmd FileType dap-repl,dapui_scopes,dapui_breakpoints,dapui_stacks,dapui_watches set nocursorline]])
