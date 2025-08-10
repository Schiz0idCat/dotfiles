return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")

            require("luasnip.loaders.from_lua").lazy_load({
                paths = { "~/.config/nvim/lua/snippets/" }
            })

            cmp.setup({
                performance = {
                    max_view_entries = 5,
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = {
                        border = "rounded",
                        scrollbar = false,
                        winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
                    },
                    documentation = {
                        border = "rounded",
                        winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
                    },
                },
                formatting = {
                    format = function(_, item)
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

                        item.kind = kind_icons[item.kind] or item.kind
                        return item
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    {
                        name = "nvim_lsp",
                        entry_filter = function(entry)
                            local kind = entry:get_kind()
                            local kind_name = vim.lsp.protocol.CompletionItemKind[kind]
                            local excluded_kinds = {
                                Interface = true,
                                Snippet = true,
                            }
                            return not excluded_kinds[kind_name]
                        end,
                    },
                    { name = "luasnip" },
                    { name = "path" },
                    { name = "buffer" },
                }),
            })

            -- Cmdline setup
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources(
                    {
                        { name = "path" },
                    },
                    {
                        { name = "cmdline" },
                    }),
            })

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    }
}
