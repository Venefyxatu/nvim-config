-- External tools installer

return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            mason.setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
                pip = {
                    upgrade_pip = true,
                },
            })
            mason_lspconfig.setup({
                ensure_installed = {
                    "bashls",  -- bash
                    "dockerls",  -- Docker
                    -- "gitlab_ci_ls",  -- gitlab-specific yaml, does not replace yamlls
                    "jsonls",  -- JSON
                    "lua_ls",  -- lua
                    "marksman",  -- markdown
                    "pyright",  -- python
                    "ruff_lsp",  -- ruff (should this replace pyright?)
                    "terraformls",  -- terraform
                    "yamlls",  -- yaml
                }
            })
        end,
    },
}

