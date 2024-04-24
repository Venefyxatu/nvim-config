return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        awk = { "awk" },
        bash = { "beautysh" },
        json = { "fixjson" },
        lua = { "stylua" },
        python = { "ruff_format", "ruff_fix" },
        terraform = { "terraform_fmt" },
        yaml = { "yamlfix" },
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        }
      end,
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! is just for the current buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, { desc = "Disable auto-format on save", bang = true }),
      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, { desc = "Re-enable auto-format on save" }),
      vim.keymap.set("n", "<leader>fe", "<cmd>FormatEnable<CR>", { desc = "Enable auto-format on save" }),
      vim.keymap.set(
        "n",
        "<leader>fd",
        "<cmd>FormatDisable<CR>",
        { desc = "Disable auto-format on save for everything" }
      ),
      vim.keymap.set(
        "n",
        "<leader>fD",
        "<cmd>FormatDisable!<CR>",
        { desc = "Disable auto-format on save for the current buffer" }
      ),
    })
  end,
}
