-- [[ Core Nvim config ]]
require 'core.keymaps'
require 'core.options'

-- [[ Autocommands ]]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Basic plugins
  require 'plugins.colorscheme',
  require 'plugins.vim-sleuth',
  require 'plugins.which-key',
  -- Snacks
  require 'plugins.snacks',
  -- Mini
  require 'plugins.mini',
  -- Flash (fast navigation)
  require 'plugins.flash',
  -- Treesitter
  require 'plugins.treesitter',
  -- LSP stuff
  require 'plugins.lazydev',
  require 'plugins.lsp',
})

-- vim: ts=2 sts=2 sw=2 et
