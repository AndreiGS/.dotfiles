vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = "*.tsx",
  callback = function()
    vim.bo.filetype = 'typescriptreact'
  end
})
