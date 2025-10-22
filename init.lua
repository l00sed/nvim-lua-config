-- Add luarocks installed packages to Lua path (LuaJIT uses 5.1 compatibility)
local home = os.getenv("HOME")
package.path = package.path .. ";" .. home .. "/.luarocks/share/lua/5.1/?.lua;" .. home .. "/.luarocks/share/lua/5.1/?/init.lua"
package.cpath = package.cpath .. ";" .. home .. "/.luarocks/lib/lua/5.1/?.so"

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
require('keymaps.default')

-- Load aliases
require('aliases.directories')

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

-- Load command customizations
require('commands')

-- Theme at the end, to prevent overwrite by other plugins
require('themes')
require('keymaps.plugins')
