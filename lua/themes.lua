-- Themes
local cmd = vim.cmd
local set_hl = vim.api.nvim_set_hl
local autocmd = vim.api.nvim_create_autocmd
local utils = require('utils')

-- Lualine transparent bg
set_hl(0, 'lualine_transitional_lualine_a_replace_to_StatusLine', { bg = 'None' })
set_hl(0, 'lualine_transitional_lualine_a_insert_to_StatusLine', { bg = 'None' })
set_hl(0, 'lualine_transitional_lualine_a_normal_to_StatusLine', { bg = 'None' })
set_hl(0, 'lualine_transitional_lualine_a_command_to_StatusLine', { bg = 'None' })
set_hl(0, 'lualine_transitional_lualine_a_visual_to_StatusLine', { bg = 'None' })

-- LSP Diagnostics
cmd [[
sign define DiagnosticSignError text= texthl=DiagnosticError linehl= numhl=
sign define DiagnosticSignWarn  text= texthl=DiagnosticWarn  linehl= numhl=
sign define DiagnosticSignInfo  text= texthl=DiagnosticInfo  linehl= numhl=
sign define DiagnosticSignHint  text= texthl=DiagnosticHint  linehl= numhl=
]]
set_hl(0, 'DiagnosticError', { fg = 'red', bg = 'None' })
set_hl(0, 'DiagnosticWarn', { fg = 'orange', bg = 'None' })
set_hl(0, 'DiagnosticInfo', { fg = 'teal', bg = 'None' })
set_hl(0, 'DiagnosticHint', { fg = 'white', bg = 'None' })

-- Bufferline Transparency
set_hl(0, 'BufferLineNumbersSelected', { bg = 'None', fg = 'white' })
set_hl(0, 'BufferLineBufferSelected', { fg = white, bg = 'None' })
set_hl(0, 'BufferLineDiagnosticSelected', { bg = 'None' })
set_hl(0, 'BufferLineHintSelected', { bg = 'None' })
set_hl(0, 'BufferLineHintDiagnosticSelected', { bg = 'None' })
set_hl(0, 'BufferLineInfoSelected', { bg = 'None' })
set_hl(0, 'BufferLineInfoDiagnosticSelected', { bg = 'None' })
set_hl(0, 'BufferLineWarningSelected', { bg = 'None' })
set_hl(0, 'BufferLineWarningDiagnosticSelected', { bg = 'None' })
set_hl(0, 'BufferLineErrorSelected', { bg = 'None' })
set_hl(0, 'BufferLineErrorDiagnosticSelected', { bg = 'None' })
set_hl(0, 'BufferLineModifiedSelected', { bg = 'None' })
set_hl(0, 'BufferLineModifiedDiagnosticSelected', { bg = 'None' })
set_hl(0, 'BufferLineDuplicateSelected', { bg = 'None' })
set_hl(0, 'BufferLineSeparatorSelected', { fg = 'None', bg = 'None' })

-- Extra HTML syntax highlighting
set_hl(0, 'htmlArg', { italic = true })
set_hl(0, 'htmlBold', { bold = true })
set_hl(0, 'htmlItalic', { italic = true })
set_hl(0, 'htmlBoldItalic', { bold = true, italic = true })

-- Additional Transparency
set_hl(0, 'Normal', { bg = 'None', ctermbg = 'None' })
set_hl(0, 'SignColumn', { bg = 'None' })
set_hl(0, 'Pmenu', { bg = 'None', ctermbg = 'None' })
set_hl(0, 'NonText', { fg = 'gray', bg = 'None' })
set_hl(0, 'NormalFloat', { bg = 'None', ctermbg = 'None' })

local theme = {
  -- grays
	["gray-10"] =  '#aaaaaa',
	["gray-15"] =  '#a3a3a3',
	["gray-25"] =  '#999999',
	["gray-55"] =  '#555555',
	["gray-80"] =  '#3a3a3a',
	["gray-85"] =  '#333333',
	["gray-95"] =  '#222222',
  -- oranges
  ["orange-10"] = '#D65D0E',
}

local indent_highlights = {
  '#333333',
  '#3c3c3c',
  '#3f3f3f',
  '#444444',
  '#4c4c4c',
  '#4f4f4f',
  '#555555',
  '#5c5c5c',
  '#5f5f5f',
  '#666666',
  '#6c6c6c',
  '#6f6f6f',
  '#777777',
  '#7c7c7c',
  '#7f7f7f',
  '#888888',
  '#8c8c8c',
  '#8f8f8f',
  '#999999',
  '#9c9c9c',
  '#9f9f9f',
}

if os.getenv("THEME_VARIANT") == 'light' then
  for i, color in ipairs(indent_highlights) do
    indent_highlights[i] = utils.invert_hex_color(color)
  end
  for i, color in pairs(theme) do
    theme[i] = utils.invert_hex_color(color)
  end
end

-- Italic comments
set_hl(0, 'Comment', { bg = 'None', fg = theme['gray-55'], italic = true })

-- Spelling
set_hl(0, 'SpellBad', { undercurl = true })
set_hl(0, 'SpellRare', { undercurl = true })
set_hl(0, 'SpellCap', { undercurl = true })
set_hl(0, 'SpellLocal', { undercurl = true })

-- Invisiblish pane separators
set_hl(0, 'VertSplit', { bg = 'None', fg = theme['gray-95'] })

-- Floating borders
set_hl(0, 'PmenuBorder', { fg = theme['gray-85'], ctermfg = 'gray', bg = 'None', ctermbg = 'None' })
set_hl(0, 'FloatBorder', { fg = theme['gray-85'], ctermfg = 'gray', bg = 'None', ctermbg = 'None' })

-- LspInfo
set_hl(0, 'LspInfoBorder', { fg = theme['gray-95'], ctermfg = 'gray', bg = 'None', ctermbg = 'None' })

-- Git signs column plugin
set_hl(0, 'GitSignsAdd', { fg = 'SpringGreen2', bg = 'None' })
set_hl(0, 'GitSignsChange', { fg = 'MediumPurple2', bg = 'None' })
set_hl(0, 'GitSignsDelete', { fg = 'Red1', bg = 'None' })

-- Cursorline
set_hl(0, 'CursorLine', { bg = theme['gray-95'] })
set_hl(0, 'CursorLineNr', { bg = theme['gray-95'], fg = theme['orange-10'] }) -- Also highlight number column

-- Folds
set_hl(0, 'Folded', { bg =  'None', fg = theme['gray-85'], bold = false, nocombine = true })

-- IndentLines
set_hl(0, 'IndentBlanklineContextStart', { sp = theme['gray-80'], underline = true }) --underline
set_hl(0, 'IndentBlanklineContextChar', { fg = theme['gray-15'], nocombine = true }) -- Active context colo
for i, hl in ipairs(indent_highlights) do
  set_hl(0, 'IndentBlanklineIndent' .. i, { fg = hl, nocombine = true })
end

-- Highlight current row in NORMAL mode,
-- hide highlight in INSERT mode
autocmd({ 'InsertEnter', 'InsertLeave' }, { pattern = '*', command = 'set cul!' })
