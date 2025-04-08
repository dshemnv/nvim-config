-- [[ Slime ]]
-- Send selection to a terminal
return {
  "jpalardy/vim-slime",
  init = function()
    vim.b["quarto_is_python_chunk"] = false
    Quarto_is_in_python_chunk = function()
      require("otter.tools.functions").is_otter_language_context("python")
    end

    vim.cmd([[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      if b:quarto_is_python_chunk
      return [a:text, "\n"]
      else
      return [a:text]
      end
      end
      endfunction
      ]])
    -- these two should be set before the plugin loads
    vim.g.slime_target = "neovim"
    vim.g.slime_no_mappings = true
    vim.g.slime_python_ipython = 1
  end,
  config = function()
    vim.g.slime_input_pid = false
    vim.g.slime_suggest_default = true
    vim.g.slime_menu_config = false
    vim.g.slime_neovim_ignore_unlisted = false
    -- options not set here are g:slime_neovim_menu_order, g:slime_neovim_menu_delimiter, and g:slime_get_jobid
    -- see the documentation above to learn about those options

    -- called MotionSend but works with textobjects as well
    vim.keymap.set(
      "n",
      "gzc",
      "<Plug>SlimeConfig",
      { remap = true, silent = false, desc = "Configure Slime target terminal" }
    )
  end,
}
