return {
  "andythigpen/nvim-coverage",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local coverage = require("coverage")
    coverage.setup({
      auto_reload = true,
    })
    vim.keymap.set("n", "<leader>TC", function()
      coverage.load(true)
    end, { desc = "Load coverage reoprt" })
    vim.keymap.set("n", "<leader>TS", coverage.summary, { desc = "Show coverage summary" })
  end,
}
