-- file tree keymaps
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

-- telescope keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fh", builtin.oldfiles, { desc = "Telescope recent files" })
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Telescope help tags" })

-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- vim.keymap.set('n', 'C-h', ':TmuxNavigateLeft<CR>')
-- vim.keymap.set('n', 'C-j', ':TmuxNavigateDown<CR>')
-- vim.keymap.set('n', 'C-k', ':TmuxNavigateUp<CR>')
-- vim.keymap.set('n', 'C-l', ':TmuxNavigateRight<CR>')

vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })

vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { silent = true })
vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { silent = true })
vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { silent = true })
vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { silent = true })
vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", { silent = true })
