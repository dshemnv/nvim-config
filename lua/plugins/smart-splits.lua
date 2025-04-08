return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  keys = function()
    local keys = {
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Move left",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Move down",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Move up",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Move right",
      },
      -- {'<C-\\>', function(), require('smart-splits').move_cursor_previous end},
    }
    return keys
  end,
}
