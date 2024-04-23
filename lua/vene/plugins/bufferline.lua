-- Prettier tabs

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
      diagnostics = "nvim_lsp",
      show_close_icon = false,
      show_duplicate_prefix = false,
      always_show_bufferline = false,
    },
  },
}
