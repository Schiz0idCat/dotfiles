local opt = vim.opt

---------->   INDENTING   <----------
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

---------->   CLIPBOARD   <----------
opt.clipboard = "unnamedplus"

---------->   ORIENTATION   <----------
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.scrolloff = 5

---------->   UI   <----------
opt.cmdheight = 0
opt.ruler = false -- This fix a bug related with telescope and ui2
opt.winborder = "rounded"

---------->   UI   <----------
opt.shortmess:append("W") -- Disable "written" message when saving
opt.report = 100          -- Disable undo/redo line change reporting

---------->   AUTOCOMMANDS   <----------
-- no numbers when is a {pattern} file type
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text" },
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})
