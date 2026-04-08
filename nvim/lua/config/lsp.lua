vim.lsp.enable({
    "bashls",
    "clangd",
    "pyright",
    "lua_ls",
    "rust_analyzer",
    "jdtls",
    "qmlls",
    "vtsls",
    "html",
    "cssls",
})

-- enviroment variables
-- java
vim.uv.os_setenv("JAVA_HOME", "/usr/lib/jvm/java-24-openjdk")

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

-- autocompletions
vim.o.complete = ".,o"                             -- suggestions from buffer and omnifunc
vim.o.completeopt = "fuzzy,menuone,noselect,popup" -- fuzzy search, menu with 1 result, docs, not autoselect
vim.o.autocomplete = false                         -- suggestions while typing
vim.o.pumheight = 5                                -- max entries

-- I'd like to configure the height and weight of the docs window. BUT I DON'T KNOW HOW

local kind_icons = {
    Text = "",
    Method = "",
    Function = "󰡱",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰫧",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "",
    File = "󰈔",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
}
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
            convert = function(item)
                -- items icon
                local kind_name = vim.lsp.protocol.CompletionItemKind[item.kind] or "Text"
                local icon = kind_icons[kind_name] or " "

                local abbr = item.label
                abbr = abbr:match("[%w_.]+.*") or abbr -- delete trash characters
                abbr = #abbr > 15 and abbr:sub(1, 14) .. "…" or abbr -- add chars limit

                abbr = icon .. " " .. abbr -- icon + name

                return { abbr = abbr, menu = "", kind = "" }
            end,
        })
    end,
})

vim.api.nvim_create_autocmd("InsertCharPre", {
    callback = function()
        if vim.fn.pumvisible() ~= 0 then return end

        if vim.v.char:match("[%w_]") then -- suggestions window is open when we start to write
            vim.schedule(function()
                vim.lsp.completion.get()
            end)
        end
    end,
})

vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5C9C5", bg = "#16161D" })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#FFFFFF", bg = "#2D4F67", bold = true })
vim.api.nvim_set_hl(0, "PmenuExtra", { fg = "#727169", italic = true })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#54546D", bg = "#16161D" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#16161D" })
