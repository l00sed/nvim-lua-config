local autocmd = vim.api.nvim_create_autocmd
local set_hl = vim.api.nvim_set_hl

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
local nvim_tree_view = require('nvim-tree.view')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return nvim_tree_view.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)

nvim_tree_events.subscribe('Resize', function()
  if nvim_tree_view.is_visible() then
    bufferline_api.set_offset(get_tree_size())
  else
    bufferline_api.set_offset(0)
  end
end)


colors = {
  ["fg_error"] = 'red',
  ["fg_target"] = 'red',
  ["fg_current"] = 'white',
  ["fg_visible"] = '#333333',
  ["fg_inactive"] = '#333333',
  ["fg_modified"] = '#d69821',
  ["fg_special"] = 'white',
  ["fg_subtle"] = '#555555',
  ["bg_current"] = 'None',
  ["bg_visible"] = 'None',
  ["bg_inactive"] = '#0f0f0f',
}

-- Current
set_hl(0, 'BufferCurrent', { fg = colors['fg_current'], bg = colors['bg_current'], bold = true })
set_hl(0, 'BufferCurrentIcon', { fg = colors['fg_current'], bg = colors['bg_current'] })
set_hl(0, 'BufferDefaultCurrentIcon', { bg = colors['bg_current'] })
set_hl(0, 'BufferCurrentIndex', { fg = colors['fg_special'], bg = colors['bg_current'], bold = true })
set_hl(0, 'BufferDefaultCurrentIndex', { bg = colors['bg_current'] })
set_hl(0, 'BufferCurrentMod', { fg = colors['fg_modified'], bg =colors['bg_current'], bold = true })
set_hl(0, 'BufferDefaultCurrentMod', { bg = colors['bg_current'] })
set_hl(0, 'BufferCurrentSign', { fg = colors['fg_special'], bg = colors['bg_current'] })
set_hl(0, 'BufferDefaultCurrentSign', { bg = colors['bg_current'] })
set_hl(0, 'BufferCurrentTarget', { fg = colors['fg_target'], bg = colors['bg_current'], bold = true })
set_hl(0, 'BufferDefaultCurrentTarget', { bg = colors['bg_current'] })
-- Visible
set_hl(0, 'BufferVisible', { fg = colors['fg_visible'], bg = colors['bg_visible'] })
set_hl(0, 'BufferVisibleIcon', { fg = colors['fg_visible'], bg = colors['bg_visible'] })
set_hl(0, 'BufferDefaultVisibleIcon', { bg = colors['bg_visible'] })
set_hl(0, 'BufferVisibleIndex', { fg = colors['fg_visible'], bg = colors['bg_visible'] })
set_hl(0, 'BufferDefaultVisibleIndex', { bg = colors['bg_visible'] })
set_hl(0, 'BufferVisibleMod', { fg = colors['fg_modified'], bg =colors['bg_visible'] })
set_hl(0, 'BufferDefaultVisibleMod', { bg = colors['bg_visible'] })
set_hl(0, 'BufferVisibleSign', { fg = colors['fg_visible'], bg = colors['bg_visible'] })
set_hl(0, 'BufferDefaultVisibleSign', { bg = colors['bg_visible'] })
set_hl(0, 'BufferVisibleTarget', { fg = colors['fg_target'], bg = colors['bg_visible'], bold = true })
set_hl(0, 'BufferDefaultVisibleTarget', { bg = colors['bg_visible'] })
-- Inactive
set_hl(0, 'BufferInactive', { fg = colors['fg_inactive'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferInactiveIcon', { fg = colors['fg_inactive'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferDefaultInactiveIcon', { bg = colors['bg_inactive'] })
set_hl(0, 'BufferInactiveIndex', { fg = colors['fg_subtle'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferDefaultInactiveIndex', { bg = colors['bg_inactive'] })
set_hl(0, 'BufferInactiveMod', { fg = colors['fg_modified'], bg =colors['bg_inactive'] })
set_hl(0, 'BufferDefaultInactiveMod', { bg = colors['bg_inactive'] })
set_hl(0, 'BufferInactiveSign', { fg = colors['fg_subtle'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferDefaultInactiveSign', { bg = colors['bg_inactive'] })
set_hl(0, 'BufferInactiveTarget', { fg = colors['fg_target'], bg = colors['bg_inactive'], bold = true })
set_hl(0, 'BufferDefaultInactiveTarget', { bg = colors['bg_inactive'] })
-- Tabpages
set_hl(0, 'BufferTabpages', { fg = colors['fg_special'], bg = colors['bg_inactive'], bold = true })
set_hl(0, 'BufferTabpageFill', { fg = colors['fg_inactive'], bg = 'None' })
-- Offset
set_hl(0, 'BufferOffset', { link = 'BufferTabpageFill' })
-- Error
set_hl(0, 'BufferVisibleERROR', { bg = colors['bg_visible'] })
set_hl(0, 'BufferDefaultVisibleERROR', { bg = colors['bg_visible'] })
set_hl(0, 'BufferCurrentERROR', { fg = colors['fg_error'], bg = colors['bg_current'] })
set_hl(0, 'BufferDefaultCurrentERROR', { fg = colors['fg_error'], bg = colors['bg_current'] })
set_hl(0, 'BufferInactiveERROR', { fg = colors['fg_inactive'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferDefaultInactiveERROR', { fg = colors['fg_inactive'], bg = colors['bg_inactive'] })
-- Warn
set_hl(0, 'BufferVisibleWARN', { bg = colors['bg_visible'] })
set_hl(0, 'BufferDefaultVisibleWARN', { bg = colors['bg_visible'] })
set_hl(0, 'BufferCurrentWARN', { fg = colors['fg_target'], bg = colors['bg_current'] })
set_hl(0, 'BufferDefaultCurrentWARN', { fg = colors['fg_target'], bg = colors['bg_current'] })
set_hl(0, 'BufferInactiveWARN', { fg = colors['fg_inactive'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferDefaultInactiveWARN', { fg = colors['fg_inactive'], bg = colors['bg_inactive'] })
-- Info
set_hl(0, 'BufferVisibleINFO', { bg = colors['bg_visible'] })
set_hl(0, 'BufferDefaultVisibleINFO', { bg = colors['bg_visible'] })
set_hl(0, 'BufferCurrentINFO', { fg = colors['fg_target'], bg = colors['bg_current'] })
set_hl(0, 'BufferDefaultCurrentINFO', { fg = colors['fg_target'], bg = colors['bg_current'] })
set_hl(0, 'BufferInactiveINFO', { fg = colors['fg_inactive'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferDefaultInactiveINFO', { fg = colors['fg_inactive'], bg = colors['bg_inactive'] })
-- Hint
set_hl(0, 'BufferVisibleHINT', { bg = colors['bg_visible'] })
set_hl(0, 'BufferDefaultVisibleHINT', { bg = colors['bg_visible'] })
set_hl(0, 'BufferCurrentHINT', { fg = colors['fg_target'], bg = colors['bg_current'] })
set_hl(0, 'BufferDefaultCurrentHINT', { fg = colors['fg_target'], bg = colors['bg_current'] })
set_hl(0, 'BufferInactiveHINT', { fg = colors['fg_inactive'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferDefaultInactiveHINT', { fg = colors['fg_inactive'], bg = colors['bg_inactive'] })
