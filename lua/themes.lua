-- Themes

local g = vim.g
local o = vim.o
local cmd = vim.cmd
local Utils = require('./utils')

-- Set transparency of pop-up
o.pumblend = 10
o.winblend = 10

-- LSP
cmd([[
sign define DiagnosticSignError text= texthl=TextError linehl= numhl=
sign define DiagnosticSignWarn  text= texthl=TextWarn  linehl= numhl=
sign define DiagnosticSignInfo  text= texthl=TextInfo  linehl= numhl=
sign define DiagnosticSignHint  text= texthl=TextHint  linehl= numhl=
autocmd ColorScheme * highlight DiagnosticSignError guifg=Red guibg=NONE
autocmd ColorScheme * highlight DiagnosticSignWarn guifg=DarkOrange3 guibg=NONE
autocmd ColorScheme * highlight DiagnosticSignInfo guifg=Red1 guibg=NONE
autocmd ColorScheme * highlight DiagnosticSignHint guifg=LightCyan1 guibg=NONE
]])

-- transparency
cmd([[
autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
autocmd ColorScheme * highlight BufferLineNumbersSelected guibg=NONE guifg=white
autocmd ColorScheme * highlight BufferLineBufferSelected guifg=white guibg=NONE
autocmd ColorScheme * highlight BufferLineDiagnosticSelected guibg=NONE
autocmd ColorScheme * highlight BufferLineHintSelected guibg=NONE
autocmd ColorScheme * highlight BufferLineHintDiagnosticSelected guibg=NONE
autocmd ColorScheme * highlight BufferLineInfoSelected guibg=NONE
autocmd ColorScheme * highlight BufferLineInfoDiagnosticSelected guibg=NONE
autocmd ColorScheme * highlight BufferLineWarningSelected guibg=NONE
autocmd ColorScheme * highlight BufferLineWarningDiagnosticSelected guibg=NONE
autocmd ColorScheme * highlight BufferLineErrorSelected guibg=NONE
autocmd ColorScheme * highlight BufferLineErrorDiagnosticSelected guibg=NONE
autocmd ColorScheme * highlight BufferLineModifiedSelected guibg=NONE
autocmd ColorScheme * highlight BufferLineModifiedDiagnosticSelected guibg=NONE
autocmd ColorScheme * highlight BufferLineDuplicateSelected guibg=NONE
autocmd ColorScheme * highlight BufferLineSeparatorSelected guifg=NONE guibg=NONE
autocmd ColorScheme * highlight SignColumn guibg=NONE
autocmd ColorScheme * highlight GitSignsAdd guifg=SpringGreen2 guibg=NONE
autocmd ColorScheme * highlight GitSignsChange guifg=MediumPurple2 guibg=NONE
autocmd ColorScheme * highlight GitSignsDelete guifg=Red1 guibg=NONE
]])

-- TokioNight
-- g.tokyonight_style = 'night'
-- g.tokyonight_italic_comments = false
-- cmd [[colorscheme tokyonight]]

-- Material
-- g.material_style = 'oceanic'
-- cmd [[colorscheme material]]

-- Gruvbox
cmd [[colo gruvbox]]
