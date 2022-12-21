local create_cmd = vim.api.nvim_create_user_command

create_cmd('PackerInstall', function()
  vim.cmd [[packadd packer.nvim]]
  require('plugins').install()
end, {})
create_cmd('PackerUpdate', function()
  vim.cmd [[packadd packer.nvim]]
  require('plugins').update()
end, {})
create_cmd('PackerSync', function()
  vim.cmd [[packadd packer.nvim]]
  require('plugins').sync()
end, {})
create_cmd('PackerClean', function()
  vim.cmd [[packadd packer.nvim]]
  require('plugins').clean()
end, {})
create_cmd('PackerCompile', function()
  vim.cmd [[packadd packer.nvim]]
  require('plugins').compile()
end, {})
create_cmd('PackerStatus', function()
  vim.cmd [[packadd packer.nvim]]
  require('plugins').status()
end, {})

-- Load all config files
require('plugins')
require('options')
require('keymaps')
require('commands')
require('themes')
-- Theme at the end, to prevent overwrite by other plugins
