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
-- icons
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

-- dinamic diagnostics
vim.diagnostic.config({
    underline = true,
    signs = true,
    virtual_text = false,
    virtual_lines = true,
    update_in_insert = true,
})

vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*",
    callback = function()
        local new_mode = vim.fn.mode()
        -- while normal mode
        if new_mode == "n" then
            vim.diagnostic.config({
                virtual_lines = false,
                virtual_text = true,
            })
        -- while any other mode
        else
            vim.diagnostic.config({
                virtual_lines = false,
                virtual_text = false,
            })
        end
    end,
})

vim.cmd [[
  hi DiagnosticVirtualTextError guibg=NONE ctermbg=NONE
  hi DiagnosticVirtualTextWarn  guibg=NONE ctermbg=NONE
  hi DiagnosticVirtualTextHint  guibg=NONE ctermbg=NONE
  hi DiagnosticVirtualTextInfo  guibg=NONE ctermbg=NONE
]]
