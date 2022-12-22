-- Startify
local g = vim.g
local cmd = vim.cmd

-- Show [e] and [q] options
g.startify_enable_special = 1
g.startify_session_autoload = 1

-- disable folding, wrapping in Startify
cmd [[au User Startified setl nofen nowrap breakindent]]

-- WebDevIcons
function _G.webDevIcons(path)
  local filename = vim.fn.fnamemodify(path, ':t')
  local extension = vim.fn.fnamemodify(path, ':e')
  return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
end
-- prepend to startify entries
cmd [[
function! StartifyEntryFormat() abort
  return 'v:lua.webDevIcons(absolute_path) . " " . entry_path'
endfunction
]]

-- Change directory when opening file using Startify
g.startify_change_to_dir  = 1  -- This is the default value

-- Add bashrc and nvim config files
g.startify_bookmarks = {
  { z = '~/.dotfiles/zsh/.zshrc' },
  { a = '~/.dotfiles/scripts/dan_aliases.sh' },
  { l = '~/.dotfiles/.dotter/local.toml' },
  { g = '~/.dotfiles/.dotter/global.toml' },
  { p = '~/.config/nvim/lua/plugins.lua' }
}

-- Change list order
g.startify_lists = {
  { type = 'bookmarks',
    header = { "  Bookmarks" }
  },
  { type = 'sessions',
    header = { "  Sessions" }
  },
  { type = 'files',
    header = { "  Recent Files" }
  },
  { type = 'dir',
    header = { "  Current Directory " .. vim.fn.expand('%') }
  },
  { type = 'commands',
    header = { "  Commands" }
  }
}
