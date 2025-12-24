vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.api.nvim_command("set listchars=tab:>→,space:·")
vim.api.nvim_command("set list")

local telescope = require('telescope')
telescope.load_extension("flutter")
vim.keymap.set('n', '<leader>fc', function()
  telescope.extensions.flutter.commands()
end, {})
