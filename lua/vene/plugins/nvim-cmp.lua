return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",  -- don't load until we go into Insert mode
    dependencies = {
        "hrsh7th/cmp-buffer",  -- source for text in buffer
        "hrsh7th/cmp-path",  -- source for file system paths
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp"
        },
        "saadparwaiz1/cmp_luasnip",  -- completion source for snippets
        "rafamadriz/friendly-snippets",  -- useful snippets
        "onsails/lspkind.nvim",  -- vscode like pictograms
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        -- load vscode style snippets from installed plugins (e.g friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                copleteopt = "menu,menuone,preview,noselect",
            },
            snippet = {  -- configure how nvim-cmp interacts with the snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            -- order = priority!
            sources = cmp.config.sources({
                { name = "nvim_lsp" },  -- actual symbols
                { name = "luasnip" },
                { name = "buffer" },  -- text within current buffer
                { name = "path" },  -- file system paths
            }),
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
        })
    end
}
