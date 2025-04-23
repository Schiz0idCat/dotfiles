vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.txt", "*.md" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "es", "en" }
  end,
})
