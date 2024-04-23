-- general behaviour
vim.opt.writebackup = false  -- no tilde files
vim.opt.autowrite = true
vim.opt.ignorecase = true
vim.opt.smartcase = true  -- mixed case search is case sensitive
vim.opt.clipboard:append("unnamedplus") -- append to system clipboard

-- visuals
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.background = "dark"
vim.cmd("syntax enable")
vim.opt.showmatch = true
vim.g.solarized_italic_comments = true
vim.g.solarized_borders = true
vim.g.solarized_contrast = false
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- indentation
local indent = 4
vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.expandtab = true

-- folding
vim.opt.foldmethod = "indent"
vim.opt.foldcolumn = "auto"
vim.opt.foldlevel = 0
vim.opt.foldenable = false


-- save behaviour
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})
