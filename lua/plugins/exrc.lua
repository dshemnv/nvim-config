-- [[ Exrc support ]]
-- Enables local config files (.nvim.lua) to change settings per project
return {
  "jedrzejboczar/exrc.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = true,
  opts = { --[[ your config ]]
  },
}
