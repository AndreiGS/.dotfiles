local telescope = require('telescope')
telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "target",
      "doc",
      "build"
    }
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ce', function()
  telescope.extensions.conda.conda {}
end, {})
