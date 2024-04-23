return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",  -- integrate auto-completion with language servers
        -- { "antosha417/nvim-lsp-file-operations", config = true },  -- file operations, needs a tree
        { "folke/neodev.nvim", opts = {} },  -- configure the Lua language server for nvim config
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")  -- auto-completion

        vim.api.nvim_create_autocmd("LspAttach", {  -- execute whenever an LSP client attaches to a buffer
          group = vim.api.nvim_create_augroup("UserLspConfig", {}),  -- group together autocmds
          callback = function(ev)
              local opts = { buffer = ev.buf, silent = false }  -- buffer to which the LSP client has attached

              -- keymaps only available when the LSP client has attached to a buffer, and only in said buffer
              opts.desc = "Show LSP references"
              vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

              opts.desc = "Go to declaration"
              vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

              opts.desc = "Show LSP definitions"
              vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

              opts.desc = "Show LSP implementations"
              vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

              opts.desc = "Show LSP type definitions"
              vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

              opts.desc = "See available code actions"
              vim.keymap.set({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, opts)

              opts.desc = "Smart rename"
              vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

              opts.desc = "Show buffer diagnostics"
              vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

              opts.desc = "Show line diagnostics"
              vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

              opts.desc = "Go to previous diagnostic"
              vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

              opts.desc = "Go to next diagnostic"
              vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

              opts.desc = "Show documentation for what is under the cursor"
              vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

              opts.desc = "Restart LSP"
              vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
            end,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },  -- make the language server recognize the "vim" global variable
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                })
            end,
        })
    end,
}
