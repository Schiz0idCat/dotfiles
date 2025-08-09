local opt = vim.opt

---------->   TAB   <----------
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

---------->   CLIPBOARD   <----------
opt.clipboard = "unnamedplus"

---------->   LINES   <----------
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.scrolloff = 5

-- no numbers when is a {pattern} file type
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
