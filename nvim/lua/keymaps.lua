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
map("n", "<C-d>", "<C-d>zz", { desc = "Move up faster" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move down faste" })

-- others
map("x", "<leader>p", "\"_dp", { desc = "Paste without overwrite the clipboard" })
map("n", "<leader>gr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left><Left>]], { desc = "Replace (case sensitive)" })
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Give execution permissions" })
map('n', '<leader>q', ':bd<CR>', { desc = 'Close current buffer' })

---------->   TELESCOPE   <----------
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

---------->   NVIMTREE   <----------
map("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

---------->   LSP   <----------
map("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Show definition" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<leader>gf", function()
    vim.lsp.buf.format()
end, { desc = "Apply format" })

---------->   BUFFERLINE    <----------
for i = 1, 9 do
  map('n', '<leader>' .. i, '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>', { desc = "[1-9] go to buffer" })
end
