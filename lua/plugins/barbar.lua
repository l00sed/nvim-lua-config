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
  -- Enables / disables diagnostic symbols
  diagnostics = {
    -- you can use a list
    {enabled = true, icon = ' '}, -- ERROR
    {enabled = false, icon = ' '}, -- WARN
    {enabled = false, icon = ' '}, -- INFO
    {enabled = false, icon = ' '},  -- HINT

    -- OR `vim.diagnostic.severity`
    [vim.diagnostic.severity.ERROR] = {enabled = true, icon = ' '},
    [vim.diagnostic.severity.WARN] = {enabled = false, icon = ' '},
    [vim.diagnostic.severity.INFO] = {enabled = false, icon = ' '},
    [vim.diagnostic.severity.HINT] = {enabled = false, icon = ' '},
  },
  -- Excludes buffers from the tabline
  exclude_ft = {'javascript'},
  exclude_name = {'package.json'},
  -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
  hide = { extensions = true, inactive = false },
  -- Disable highlighting alternate buffers
  highlight_alternate = false,
  -- Disable highlighting file icons in inactive buffers
  highlight_inactive_file_icons = false,
  -- Enable highlighting visible buffers
  highlight_visible = true,
  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,
  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,
  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = true,
  insert_at_start = false,
  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,
  -- Sets the minimum padding width with which to surround each tab
  minimum_padding = 1,
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

-- Offset for filetree
autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      require'bufferline.api'.set_offset(31, 'FileTree')
    end
  end
})

-- Offset for filetree
autocmd('BufWinLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.expand('<afile>'):match('NvimTree') then
      require'bufferline.api'.set_offset(0)
    end
  end
})

colors = {
  ["fg_target"] = 'red',
  ["fg_current"] = 'white',
  ["fg_visible"] = 'white',
  ["fg_inactive"] = 'gray',
  ["fg_modified"] = 'orange',
  ["fg_special"] = 'teal',
  ["fg_subtle"] = 'gray',
  ["bg_current"] = '#000000',
  ["bg_visible"] = '#000000',
  ["bg_inactive"] = 'None',
}

set_hl(0, 'BufferCurrent', { fg = colors['fg_current'], bg = colors['bg_current'] })
set_hl(0, 'BufferCurrentIndex', { fg = colors['fg_special'], bg = colors['bg_current'] })
set_hl(0, 'BufferCurrentMod', { fg = colors['fg_modified'], bg =colors['bg_current'] })
set_hl(0, 'BufferCurrentSign', { fg = colors['fg_special'], bg = colors['bg_current'] })
set_hl(0, 'BufferCurrentTarget', { fg = colors['fg_target'], bg = colors['bg_current'], bold = true })
set_hl(0, 'BufferVisible', { fg = colors['fg_visible'], bg = colors['bg_visible'] })
set_hl(0, 'BufferVisibleIndex', { fg = colors['fg_visible'], bg = colors['bg_visible'] })
set_hl(0, 'BufferVisibleMod', { fg = colors['fg_modified'], bg =colors['bg_visible'] })
set_hl(0, 'BufferVisibleSign', { fg = colors['fg_visible'], bg = colors['bg_visible'] })
set_hl(0, 'BufferVisibleTarget', { fg = colors['fg_target'], bg = colors['bg_visible'], bold = true })
set_hl(0, 'BufferInactive', { fg = colors['fg_inactive'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferInactiveIndex', { fg = colors['fg_subtle'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferInactiveMod', { fg = colors['fg_modified'], bg =colors['bg_inactive'] })
set_hl(0, 'BufferInactiveSign', { fg = colors['fg_subtle'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferInactiveTarget', { fg = colors['fg_target'], bg = colors['bg_inactive'], bold = true })
set_hl(0, 'BufferTabpages', { fg = colors['fg_special'], bg = colors['bg_inactive'],bold = true })
set_hl(0, 'BufferTabpageFill', { fg = colors['fg_inactive'], bg =colors['bg_inactive'] })
set_hl(0, 'BufferCurrentIcon', { link = 'BufferCurrent' })
set_hl(0, 'BufferVisibleIcon', { link = 'BufferVisible' })
set_hl(0, 'BufferInactiveIcon', { link = 'BufferInactive' })
set_hl(0, 'BufferOffset', { link = 'BufferTabpageFill' })
set_hl(0, 'BufferDefaultInactiveERROR', { fg = colors['fg_target'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferDefaultInactiveWARN', { fg = colors['fg_target'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferDefaultInactiveINFO', { fg = colors['fg_target'], bg = colors['bg_inactive'] })
set_hl(0, 'BufferDefaultInactiveHINT', { fg = colors['fg_target'], bg = colors['bg_inactive'] })
