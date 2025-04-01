-- Task manager

return {
  "stevearc/overseer.nvim",
  opts = {},

  config = function()
    local overseer = require("overseer")

    overseer.setup()
    overseer.enable_dap()
  end,
}
