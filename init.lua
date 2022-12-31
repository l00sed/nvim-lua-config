-- Bootstrap lazy.nvim plugin loader
------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- If lazyloader not downloaded, clone from github
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
-- Make Lazy available
vim.opt.runtimepath:prepend(lazypath)
------------------------------------

-- Load native Neovim options (NO PLUGIN SETTINGS)
require('options')

-- Lazy options
local opts = {
  install = {
    colorscheme = { "gruvbox-dark" }
  },
  ui = {
    border = "rounded"
  }
}
-- Install plugins
require('lazy').setup(require('plugins'), opts)
-- Run Mason afterwards to install language servers separately
require('plugins.mason')

-- Load keymap customizations
require('keymaps')

-- Load command customizations
require('commands')

-- Theme at the end, to prevent overwrite by other plugins
require('themes')
