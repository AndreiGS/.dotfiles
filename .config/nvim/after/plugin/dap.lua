local dap = require'dap'

vim.keymap.set("n", "db", function() dap.toggle_breakpoint() end, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "dc", function() dap.continue() end, { desc = "DAP: Start/Continue Debugging" })
vim.keymap.set("n", "d<Right>", function() dap.step_over() end, { desc = "DAP: Step Over" })
vim.keymap.set("n", "d<Down>", function() dap.step_into() end, { desc = "DAP: Step Into" })
vim.keymap.set("n", "d<Up>", function() dap.step_out() end, { desc = "DAP: Step Out" })

dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/opt/llvm/bin/lldb-dap', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
