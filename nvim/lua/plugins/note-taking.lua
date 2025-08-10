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
        end
    },
    {
        "folke/snacks.nvim",
        opts = {
            image = {
                doc = {
                    max_width = 40,
                    max_height = 20,
                }
            }
        }
    },
}
