local dap, dapui = require('dap'), require("dapui")

-- DapUI config
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dapui.setup({
  floating = {
    border = "rounded"
  }
})

-- Python dap config
local venv = os.getenv("VIRTUAL_ENV")
dap.adapters.python = {
  type = 'executable';
  command = vim.fn.executable(string.format("%s/bin/python",venv)) == 1 and string.format("%s/bin/python",venv) or '/usr/bin/python',
  args = { '-m', 'debugpy.adapter' };
}

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
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb",
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.expand('%:r')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
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
    runInTerminal = false,
  },
}
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
