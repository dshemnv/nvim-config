return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "snacks_picker",
      lsp = {
        -- `config` is passed to `vim.lsp.start(config)`
        config = {
          name = "zk",
          cmd = { "zk", "lsp" },
          filetypes = { "markdown" },
          -- on_attach = ...
          -- etc, see `:h vim.lsp.start()`
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
          enabled = true,
        },
      },
    })
  end,
  keys = {
    {
      "<leader>zn",
      function()
        vim.ui.input({ prompt = "Title:" }, function(title)
          require("zk.commands").get("ZkNew")({ title = title })
        end)
      end,
      desc = "Create a new note",
    },
    { "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = "Open recent notes" },
    { "<leader>zt", "<Cmd>ZkTags<CR>", desc = "Open notes associated with the selected tags" },
    {
      "<leader>zf",
      function()
        vim.ui.input({ prompt = "Search:" }, function(search)
          require("zk.commands").get("ZkNotes")({ sort = { "modified" }, match = { search } })
        end)
      end,
      desc = "Search in notes",
    },
    { "<leader>zf", ":'<,'>ZkMatch<CR>", desc = "Match current selection", mode = "v" },
  },
}
