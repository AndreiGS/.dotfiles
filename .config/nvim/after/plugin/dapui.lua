local dap, dapui = require("dap"), require("dapui")

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set("n", "<leader>ev", function() dapui.eval() end, { desc = "DAP UI: Evaluate Expression" })
vim.keymap.set("n", "<leader>dt", function() dapui.toggle() end, { desc = "DAP UI: Toggle Debugger UI" })

