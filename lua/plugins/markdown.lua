-- [[ Markdown preview ]]
return {
  "OXY2DEV/markview.nvim",
  dependencies = {
    "saghen/blink.cmp",
  },
  lazy = false,
  ft = { "markdown", "quarto" },
  opts = {
    preview = {
      icon_provider = "mini",
    },
  },
}
