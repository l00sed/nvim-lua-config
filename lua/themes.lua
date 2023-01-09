-- Themes
local cmd = vim.cmd
local api = vim.api

-- Lualine fix
api.nvim_set_hl(0, 'lualine_transitional_lualine_a_replace_to_StatusLine', { bg = 'None' })
api.nvim_set_hl(0, 'lualine_transitional_lualine_a_insert_to_StatusLine', { bg = 'None' })
api.nvim_set_hl(0, 'lualine_transitional_lualine_a_normal_to_StatusLine', { bg = 'None' })
api.nvim_set_hl(0, 'lualine_transitional_lualine_a_command_to_StatusLine', { bg = 'None' })
api.nvim_set_hl(0, 'lualine_transitional_lualine_a_visual_to_StatusLine', { bg = 'None' })

-- LSP Diagnostics
cmd [[
sign define DiagnosticSignError text= texthl=DiagnosticError linehl= numhl=
sign define DiagnosticSignWarn  text= texthl=DiagnosticWarn  linehl= numhl=
sign define DiagnosticSignInfo  text= texthl=DiagnosticInfo  linehl= numhl=
sign define DiagnosticSignHint  text= texthl=DiagnosticHint  linehl= numhl=
]]
api.nvim_set_hl(0, 'DiagnosticError', { fg = 'red', bg = 'None' })
api.nvim_set_hl(0, 'DiagnosticWarn', { fg = 'orange', bg = 'None' })
api.nvim_set_hl(0, 'DiagnosticInfo', { fg = 'teal', bg = 'None' })
api.nvim_set_hl(0, 'DiagnosticHint', { fg = 'white', bg = 'None' })

-- Additional Transparency
api.nvim_set_hl(0, 'VertSplit', { bg = 'None', fg= '#222222' })
api.nvim_set_hl(0, 'Normal', { bg = 'None', ctermbg = 'None' })
api.nvim_set_hl(0, 'SignColumn', { bg = 'None' })
api.nvim_set_hl(0, 'Pmenu', { bg = 'None', ctermbg = 'None' })
api.nvim_set_hl(0, 'PmenuBorder', { fg = '#333333', ctermfg = 'gray', bg = 'None', ctermbg = 'None' })
api.nvim_set_hl(0, 'NonText', { fg = 'gray', bg = 'None' })
api.nvim_set_hl(0, 'NormalFloat', { bg = 'None', ctermbg = 'None' })
api.nvim_set_hl(0, 'FloatBorder', { fg = '#333333', ctermfg = 'gray', bg = 'None', ctermbg = 'None' })

-- Bufferline Transparency
api.nvim_set_hl(0, 'BufferLineNumbersSelected', { bg = 'None', fg = 'white' })
api.nvim_set_hl(0, 'BufferLineBufferSelected', { fg = white, bg = 'None' })
api.nvim_set_hl(0, 'BufferLineDiagnosticSelected', { bg = 'None' })
api.nvim_set_hl(0, 'BufferLineHintSelected', { bg = 'None' })
api.nvim_set_hl(0, 'BufferLineHintDiagnosticSelected', { bg = 'None' })
api.nvim_set_hl(0, 'BufferLineInfoSelected', { bg = 'None' })
api.nvim_set_hl(0, 'BufferLineInfoDiagnosticSelected', { bg = 'None' })
api.nvim_set_hl(0, 'BufferLineWarningSelected', { bg = 'None' })
api.nvim_set_hl(0, 'BufferLineWarningDiagnosticSelected', { bg = 'None' })
api.nvim_set_hl(0, 'BufferLineErrorSelected', { bg = 'None' })
api.nvim_set_hl(0, 'BufferLineErrorDiagnosticSelected', { bg = 'None' })
api.nvim_set_hl(0, 'BufferLineModifiedSelected', { bg = 'None' })
api.nvim_set_hl(0, 'BufferLineModifiedDiagnosticSelected', { bg = 'None' })
api.nvim_set_hl(0, 'BufferLineDuplicateSelected', { bg = 'None' })
api.nvim_set_hl(0, 'BufferLineSeparatorSelected', { fg = 'None', bg = 'None' })

-- Git signs column plugin
api.nvim_set_hl(0, 'GitSignsAdd', { fg = 'SpringGreen2', bg = 'None' })
api.nvim_set_hl(0, 'GitSignsChange', { fg = 'MediumPurple2', bg = 'None' })
api.nvim_set_hl(0, 'GitSignsDelete', { fg = 'Red1', bg = 'None' })

-- Cursorline
api.nvim_set_hl(0, 'CursorLine', { bg = '#333333' })
api.nvim_set_hl(0, 'CursorLineNr', { bg = '#333333', fg = 'orange' }) -- Also highlight number column

-- Folds
api.nvim_set_hl(0, 'Folded', { bg =  'None', fg = '#444444', bold = false, nocombine = true })

-- IndentLines
--IndentBlanklineContextStart, { sp = '#3a3a3a', underline = true }, --underline
api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = '#a3a3a3', nocombine = true }) -- Active context colo
indent_highlights = {
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
for i=1,21,1 do
  api.nvim_set_hl(0, 'IndentBlanklineIndent' .. tostring(i), { fg = indent_highlights[i], nocombine = true })
end
