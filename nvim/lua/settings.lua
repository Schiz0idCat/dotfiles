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
opt.scrolloff = 10

----------> DIAGNOSTIC <----------
local signs = {
    Error = "",
    Warn  = "",
    Hint  = "󰌵",
    Info  = ""
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

----------> OTHERS <----------
opt.termguicolors = true
