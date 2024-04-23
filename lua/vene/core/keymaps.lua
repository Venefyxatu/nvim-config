local telescope_builtin = require("telescope.builtin")

local function toggle_relnum()
  vim.opt.relativenumber = not(vim.opt.relativenumber:get())
end

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", {desc = "Open parent directory"})
vim.keymap.set("n", "<leader>n", toggle_relnum, {})
vim.keymap.set("n", "<leader>hh", ":nohl<CR>", {desc = "Clear search highlights"})
-- vim.keymap.set("i", "<leader>jk", "<ESC>", {desc = "Exit insert mode with <leader>jk"})

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=false no_ignore=false<CR>", {desc = "Fuzzy find files limited"})
vim.keymap.set("n", "<leader>fF", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>", {desc = "Fuzzy find files unlimited"})
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {desc = "Grep through files"})
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {desc = "Fuzzy find buffers"})
vim.keymap.set("n", "<leader>fs", telescope_builtin.lsp_document_symbols, {desc = "Fuzzy find LSP symbols in current buffer"})
vim.keymap.set("n", "<leader>fc", telescope_builtin.grep_string, {desc = "Grep string under cursor"})
vim.keymap.set("n", "<leader>ft", telescope_builtin.treesitter, {desc = "Treesitter symbols"})

-- Splits
vim.keymap.set("n", "<leader>sv", "<C-w>v", {desc = "Vertical split"})
vim.keymap.set("n", "<leader>sh", "<C-w>s", {desc = "Horizontal split"})
vim.keymap.set("n", "<leader>s=", "<C-w>=", {desc = "Make splits equal size"})
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", {desc = "Close current split"})
vim.keymap.set("n", "<leader>s_", "<C-w>_", {desc = "Maximize vertically"})
vim.keymap.set("n", "<leader>s|", "<C-w>|", {desc = "Maximize horizontally"})

-- Navigation
vim.keymap.set("n", "<leader>j", "<C-w>j", {})
vim.keymap.set("n", "<leader>k", "<C-w>k", {})
vim.keymap.set("n", "<leader>h", "<C-w>h", {})
vim.keymap.set("n", "<leader>l", "<C-w>l", {})
vim.keymap.set("n", "<leader>d", "<C-d>", {})
vim.keymap.set("n", "<leader>u", "<C-u>", {})

-- Selection
vim.keymap.set("n", "<leader>bv", "<C-v>", {desc = "Vertical block select"})
vim.keymap.set("n", "<leader>bl", "<S-v>", {desc = "Line select"})

-- Tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {desc = "New tab"})
vim.keymap.set("n", "<leader>toc", "<cmd>tabnew %<CR>", {desc = "New tab with current buffer"})
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", {desc = "Close tab"})
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", {desc = "Next tab"})
vim.keymap.set("n", "<leader>tp", "<cmd>tabprev<CR>", {desc = "Previous tab"})

-- Session management
vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", {desc = "Save session"})
vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", {desc = "Restore session"})
