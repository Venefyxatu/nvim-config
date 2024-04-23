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
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })
  end,
}
