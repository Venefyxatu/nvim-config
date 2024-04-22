local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugin_specs = {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "vene.plugins.lsp.config"
        end,
    },
}

local lazy_opts = {
    ui = {
        border = "rounded",
        defaults = {
            lazy = true,
        },
        title = " Plugin Manager ",
        title_pos = "center",
        icons = {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
    change_detection = {
        notify = false,
    },
}

local external_packages = {
}

require("lazy").setup({ { import ="vene.plugins" }, { import = "vene.plugins.lsp" } }, lazy_opts)
-- require("mason-tool-installer").setup({ensure_installed = external_packages})
-- require("lspconfig").terraformls.setup({})
