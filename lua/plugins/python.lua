-- [[ Python plugins ]]
return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  branch = "regexp",
  opts = {
    -- Your options go here
    -- name = "venv",
    -- auto_refresh = false
  },
  ft = "python",
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { "<leader>vs", "<cmd>VenvSelect<cr>" },
  },
}
