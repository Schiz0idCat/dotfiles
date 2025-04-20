return {
    "hrsh7th/nvim-cmp",
    opts = function (_, opts)
        opts.sources = {
            {
                name = "nvim_lsp", -- only LSP autocompletion
                entry_filter = function (entry, _)
                    local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
                    local allowed_kinds = { -- labels kind that I want to see
                        Function = true,
                        Variable = true,
                        Struct = true,
                        Field = true,
                        Type = true,
                        Keyword = true,
                        Snippet = true,
                        -- Folder = true, -- it doesn't works btw
                        -- File = true, -- it doesn't works btw
                    }
                    return allowed_kinds[kind] == true
                end,
            },

            { name = "path" } -- recover path suggestions
        }
        return opts
    end,
}
