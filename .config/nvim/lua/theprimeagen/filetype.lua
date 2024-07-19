local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufRead", "BufNewFile"}, {
   pattern = "*.axaml",
   command = [[set filetype=xml]],
})

autocmd({"BufRead" , "BufNewFile"}, {
  pattern = "*.tsx",
   command = [[set filetype=typescript]],
})
