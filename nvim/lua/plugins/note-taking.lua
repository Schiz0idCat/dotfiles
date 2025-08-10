return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    config = function()
        require('render-markdown').setup({
            -- callout = {
            --     idea = { raw = '[!IDEA]', rendered = '󰛨 Idea', highlight = 'RenderMarkdownSuccess', category = 'personal' },
            -- }
        })
    end
}
