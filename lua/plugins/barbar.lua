local autocmd = vim.api.nvim_create_autocmd

-- Set barbar's options
require('bufferline').setup({
  -- Enable/disable animations
  animation = true,
  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = true,
  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,
  -- Enable/disable close button
  closable = true,
  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,
  -- Excludes buffers from the tabline
  exclude_ft = {},
  exclude_name = {},
  -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
  hide = {
    extensions = true,
    inactive = false
  },
  -- Disable highlighting alternate buffers
  highlight_alternate = false,
  -- Disable highlighting file icons in inactive buffers
  highlight_inactive_file_icons = false,
  -- Enable highlighting visible buffers
  highlight_visible = true,
  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = {
    buffer_index = true,
    button = '✗ ',
    filetype = {
      enabled = true
    },
    -- Enables / disables diagnostic symbols
    diagnostics = {
      -- you can use a list
      { enabled = true,  icon = ' ' }, -- ERROR
      { enabled = false, icon = ' ' }, -- WARN
      { enabled = false, icon = ' ' }, -- INFO
      { enabled = false, icon = ' ' }, -- HINT

      -- OR `vim.diagnostic.severity`
      [ vim.diagnostic.severity.ERROR ] = { enabled = true,  icon = ' ' },
      [ vim.diagnostic.severity.WARN ]  = { enabled = false, icon = ' ' },
      [ vim.diagnostic.severity.INFO ]  = { enabled = false, icon = ' ' },
      [ vim.diagnostic.severity.HINT ]  = { enabled = false, icon = ' ' },
    },
    -- Configure icons on the bufferline.
    separator = {
      left = '┃',
    },
    inactive = {
      separator = {
        left = '┃',
      },
    },
    modified = {
      button = '● ',
    },
    pinned = {
      button = '車',
    }
  },
  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,
  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = true,
  insert_at_start = false,
  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 2,
  -- Sets the minimum padding width with which to surround each tab
  minimum_padding = 2,
  -- Sets the maximum buffer name length.
  maximum_length = 30,
  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,
  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
})

local nvim_tree_events = require('nvim-tree.events')
local api = require('nvim-tree.api')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  -- Get the ID of the nvim-tree window
  local winid = api.tree.winid()
  -- Return the width of the nvim-tree window
  if (winid) then
    return vim.api.nvim_win_get_width(winid)
  else
    return 0
  end
end

-- Set the offset for bufferline when nvim-tree is opened
nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(30)
end)

-- Set the offset to 0 when nvim-tree is closed
nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)

-- Resize the bufferline offset to match the nvim-tree window width
autocmd('WinResized', {
  pattern = '*',
  callback = function()
    bufferline_api.set_offset(get_tree_size())
  end,
})
