local map = vim.keymap.set
vim.g.mapleader = " "

---------->   GENERAL   <----------
-- windows navigation
-- local opts = { noremap = true, silent = true, desc = "Window navigation" }
-- map("n", "<C-h>", "<C-w>h", opts)
-- map("n", "<C-j>", "<C-w>j", opts)
-- map("n", "<C-k>", "<C-w>k", opts)
-- map("n", "<C-l>", "<C-w>l", opts)

-- code movement
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move a piece of code" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move a piece of code" })
map("n", "<C-j>", "<C-d>zz", { desc = "Move up faster" })
map("n", "<C-k>", "<C-u>zz", { desc = "Move down faste" })

-- others
map("x", "<leader>p", "\"_dp", { desc = "Paste without overwrite" })
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Give execution permissions" })

vim.keymap.set('n', '<M-o>', 'o<Esc>o<Esc>^i', { desc = 'Insert 2 lines below', noremap = true, silent = true })
vim.keymap.set('n', '<M-O>', 'O<Esc>O<Esc>^i', { desc = 'Insert 2 lines above', noremap = true, silent = true })

map('n', '<leader>qq', ':bd<CR>', { desc = 'Close current buffer' })
map({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", { noremap = true, desc = "Save file" })

map('n', '<C-a>', ':%y+<CR>', { noremap = true, silent = true, desc = "copy all" })

map("n", "<leader>rb", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]], { desc = "Replace in buffer" })
map("n", "<leader>rp", function()
    local word = vim.fn.input("Search: ")
    local replacement = vim.fn.input("Replace: ")
    if word == "" then return end
    vim.cmd("vimgrep /" .. word .. "/ `find . -type f`")
    vim.cmd("copen")
    vim.cmd("cdo %s/" .. word .. "/" .. replacement .. "/gc")
    vim.cmd("cclose")
end, { desc = "Replace in proyect", noremap = true })

---------->   TELESCOPE   <----------
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope diagnostics" })

---------->   NVIMTREE   <----------
map("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

---------->   LSP   <----------
map("n", "<leader>rl", vim.lsp.buf.rename, { desc = "lsp rename" })
map("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Show definition" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<leader>gf", function()
    vim.lsp.buf.format()
end, { desc = "Apply format" })

---------->   BUFFERLINE    <----------
for i = 1, 9 do
    map('n', '<leader>' .. i, '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>', { desc = "[1-9] go to buffer" })
    map("n", "<leader>q" .. i, function()
        local ok, bufferline = pcall(require, "bufferline")
        if not ok then
            vim.notify("Bufferline not loaded", vim.log.levels.ERROR)
            return
        end

        bufferline.exec(i, function(buf)
            vim.cmd("bdelete " .. buf.id)
        end)
    end, { desc = "[1-9] Close buffer " })
end

---------->   git   <----------
map("n", "<leader>gc", ":Gitsigns preview_hunk_inline<CR>", { desc = "show git changes" })
map("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "toggle blame" })
