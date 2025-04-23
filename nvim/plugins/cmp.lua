return {
    "hrsh7th/nvim-cmp",
    opts = function (_, opts)
        opts.sources = {
            {
                name = "nvim_lsp", -- LSP autocompletion
                max_item_count = 5, -- max suggestions
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
                        Constant = true,
                        Class = true,
                    }
                    return allowed_kinds[kind] == true
                end,
            },
            {
                name = "path",  -- path autocompletion
                max_item_count = 5, -- max suggestions
            },
        }
        return opts
    end,
}
