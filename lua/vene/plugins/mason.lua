-- External tools installer

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason-lspconfig.nvim", -- install language servers
      "WhoIsSethDaniel/mason-tool-installer.nvim", -- install tools that are not language servers
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")
      local mason_dap_installer = require("mason-nvim-dap")

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
        automatic_installation = true,
        ensure_installed = {
          "bashls", -- bash
          "clangd", -- clangd for c++
          "dockerls", -- Docker
          -- "gitlab_ci_ls",  -- gitlab-specific yaml, does not replace yamlls
          "jsonls", -- JSON
          "lua_ls", -- lua
          "marksman", -- markdown
          "pyright", -- python
          "ruff", -- ruff (should this replace pyright?)
          "terraformls", -- terraform
          "yamlls", -- yaml
        },
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "beautysh",
          "codelldb", -- debugger for c++
          "fixjson",
          "stylua",
          "ruff",
          "yamlfix",
        },
      })

      mason_dap_installer.setup({
        automatic_installation = true,
        ensure_installed = {
          "python",
        },
      })
    end,
  },
}
