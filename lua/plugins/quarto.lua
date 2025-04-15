return {
  "quarto-dev/quarto-nvim",
  dependencies = {
    "jmbuhr/otter.nvim",
    "nvim-treesitter/nvim-treesitter",
    "jpalardy/vim-slime",
  },
  opts = {
    debug = false,
    closePreviewOnExit = true,
    lspFeatures = {
      enabled = true,
      chunks = "curly",
      languages = { "python", "bash", "html" },
      diagnostics = {
        enabled = true,
        triggers = { "BufWritePost" },
      },
      completion = {
        enabled = true,
      },
    },
    codeRunner = {
      enabled = true,
      default_method = "slime", -- "molten", "slime", "iron" or <function>
      ft_runners = {
        python = "slime",
      }, -- filetype to runner, ie. `{ python = "molten" }`.
      -- Takes precedence over `default_method`
      never_run = { "yaml" }, -- filetypes which are never sent to a code runner
    },
  },
  ft = { "quarto" },
  config = function(_, opts)
    local runner = require("quarto.runner")
    vim.keymap.set("n", "<localleader>rc", runner.run_cell, { desc = "run cell", silent = true })
    vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
    vim.keymap.set("n", "<localleader>rA", runner.run_all, { desc = "run all cells", silent = true })
    vim.keymap.set("n", "<localleader>rl", runner.run_line, { desc = "run line", silent = true })
    vim.keymap.set("v", "<localleader>r", runner.run_range, { desc = "run visual range", silent = true })
    vim.keymap.set("n", "<localleader>RA", function()
      runner.run_all(true)
    end, { desc = "run all cells of all languages", silent = true })
  end,
  keys = {
    {
      "<localleader>t",
      function()
        local Snacks = require("snacks")
        local opts = {
          win = {
            position = "right",
            width = 0.3,
          },
        }
        Snacks.terminal("ipython", opts)
      end,
      desc = "Toggle ipython terminal",
      ft = "quarto",
      mode = { "n", "t" },
    },
  },
}
