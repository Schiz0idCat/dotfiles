vim.lsp.enable({
    "bashls",
    "clangd",
    "pyright",
    "lua_ls",
    "rust_analyzer",
    "jdtls",
    "qmlls",
})

-- dinamic diagnostics
vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    virtual_lines = true,
    update_in_insert = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰌵",
            [vim.diagnostic.severity.INFO] = "",
        }
    }
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

-- diagnostics text with transparent background
vim.cmd [[
  hi DiagnosticVirtualTextError guibg=NONE ctermbg=NONE
  hi DiagnosticVirtualTextWarn  guibg=NONE ctermbg=NONE
  hi DiagnosticVirtualTextHint  guibg=NONE ctermbg=NONE
  hi DiagnosticVirtualTextInfo  guibg=NONE ctermbg=NONE
]]

-- floating diagnostic windows
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f2329" }) -- popup background
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7a818e", bg = "#1f2329" }) -- border color
