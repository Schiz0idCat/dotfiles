return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        ---@module 'render-markdown'
        config = function()
            require('render-markdown').setup({
                file_types = { 'markdown', 'vimwiki' },
                vim.treesitter.language.register("markdown", "vimwiki"),

                callout = {
                    idea = { raw = '[!IDEA]', rendered = '󰛨 Idea', highlight = 'RenderMarkdownSuccess', category = 'personal' },
                    extra = { raw = '[!EXTRA]', rendered = '󱞁 Extra', highlight = 'RenderMarkdownWarn', category = 'personal' },
                }
            })
        end
    },
    {
        "vimwiki/vimwiki",
        init = function()
            vim.g.vimwiki_list = {
                { path = "~/vimwiki", syntax = "markdown", ext = ".md" }
            }

            -- checkmate compatibility
            vim.api.nvim_create_autocmd("BufReadPost", {
                pattern = { "todo.md", "*.todo" },
                callback = function()
                    vim.schedule(function()
                        vim.bo.filetype = "markdown"
                    end)
                end,
            })
        end
    },
    {
        "folke/snacks.nvim",
        opts = {
            image = {
                doc = {
                    max_width = 80,
                    max_height = 30,
                }
            }
        }
    },
    {
        "bngarren/checkmate.nvim",
        ft = "markdown",
        opts = {},
    }
}
