-- Themes
local cmd = vim.cmd
local set_hl = vim.api.nvim_set_hl
local autocmd = vim.api.nvim_create_autocmd
local utils = require('utils')

-- Lualine fix
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

local colors = {
	["transparent"] =  "transparent",
	["black"] =  "#000000",
	["white"] =  "#ffffff",
	["red"] =  "#f44336",
	["red-50"] =  "#ffebee",
	["red-100"] =  "#ffcdd2",
	["red-200"] =  "#ef9a9a",
	["red-300"] =  "#e57373",
	["red-400"] =  "#ef5350",
	["red-500"] =  "#f44336",
	["red-600"] =  "#e53935",
	["red-700"] =  "#d32f2f",
	["red-800"] =  "#c62828",
	["red-900"] =  "#b71c1c",
	["red-100-accent"] =  "#ff8a80",
	["red-200-accent"] =  "#ff5252",
	["red-400-accent"] =  "#ff1744",
	["red-700-accent"] =  "#d50000",
	["pink"] =  "#e91e63",
	["pink-50"] =  "#fce4ec",
	["pink-100"] =  "#f8bbd0",
	["pink-200"] =  "#f48fb1",
	["pink-300"] =  "#f06292",
	["pink-400"] =  "#ec407a",
	["pink-500"] =  "#e91e63",
	["pink-600"] =  "#d81b60",
	["pink-700"] =  "#c2185b",
	["pink-800"] =  "#ad1457",
	["pink-900"] =  "#880e4f",
	["pink-100-accent"] =  "#ff80ab",
	["pink-200-accent"] =  "#ff4081",
	["pink-400-accent"] =  "#f50057",
	["pink-700-accent"] =  "#c51162",
	["purple"] =  "#9c27b0",
	["purple-50"] =  "#f3e5f5",
	["purple-100"] =  "#e1bee7",
	["purple-200"] =  "#ce93d8",
	["purple-300"] =  "#ba68c8",
	["purple-400"] =  "#ab47bc",
	["purple-500"] =  "#9c27b0",
	["purple-600"] =  "#8e24aa",
	["purple-700"] =  "#7b1fa2",
	["purple-800"] =  "#6a1b9a",
	["purple-900"] =  "#4a148c",
	["purple-100-accent"] =  "#ea80fc",
	["purple-200-accent"] =  "#e040fb",
	["purple-400-accent"] =  "#d500f9",
	["purple-700-accent"] =  "#aa00ff",
	["deep-purple"] =  "#673ab7",
	["deep-purple-50"] =  "#ede7f6",
	["deep-purple-100"] =  "#d1c4e9",
	["deep-purple-200"] =  "#b39ddb",
	["deep-purple-300"] =  "#9575cd",
	["deep-purple-400"] =  "#7e57c2",
	["deep-purple-500"] =  "#673ab7",
	["deep-purple-600"] =  "#5e35b1",
	["deep-purple-700"] =  "#512da8",
	["deep-purple-800"] =  "#4527a0",
	["deep-purple-900"] =  "#311b92",
	["deep-purple-100-accent"] =  "#b388ff",
	["deep-purple-200-accent"] =  "#7c4dff",
	["deep-purple-400-accent"] =  "#651fff",
	["deep-purple-700-accent"] =  "#6200ea",
	["indigo"] =  "#3f51b5",
	["indigo-50"] =  "#e8eaf6",
	["indigo-100"] =  "#c5cae9",
	["indigo-200"] =  "#9fa8da",
	["indigo-300"] =  "#7986cb",
	["indigo-400"] =  "#5c6bc0",
	["indigo-500"] =  "#3f51b5",
	["indigo-600"] =  "#3949ab",
	["indigo-700"] =  "#303f9f",
	["indigo-800"] =  "#283593",
	["indigo-900"] =  "#1a237e",
	["indigo-100-accent"] =  "#8c9eff",
	["indigo-200-accent"] =  "#536dfe",
	["indigo-400-accent"] =  "#3d5afe",
	["indigo-700-accent"] =  "#304ffe",
	["blue"] =  "#2196f3",
	["blue-50"] =  "#e3f2fd",
	["blue-100"] =  "#bbdefb",
	["blue-200"] =  "#90caf9",
	["blue-300"] =  "#64b5f6",
	["blue-400"] =  "#42a5f5",
	["blue-500"] =  "#2196f3",
	["blue-600"] =  "#1e88e5",
	["blue-700"] =  "#1976d2",
	["blue-800"] =  "#1565c0",
	["blue-900"] =  "#0d47a1",
	["blue-100-accent"] =  "#82b1ff",
	["blue-200-accent"] =  "#448aff",
	["blue-400-accent"] =  "#2979ff",
	["blue-700-accent"] =  "#2962ff",
	["light-blue"] =  "#03a9f4",
	["light-blue-50"] =  "#e1f5fe",
	["light-blue-100"] =  "#b3e5fc",
	["light-blue-200"] =  "#81d4fa",
	["light-blue-300"] =  "#4fc3f7",
	["light-blue-400"] =  "#29b6f6",
	["light-blue-500"] =  "#03a9f4",
	["light-blue-600"] =  "#039be5",
	["light-blue-700"] =  "#0288d1",
	["light-blue-800"] =  "#0277bd",
	["light-blue-900"] =  "#01579b",
	["light-blue-100-accent"] =  "#80d8ff",
	["light-blue-200-accent"] =  "#40c4ff",
	["light-blue-400-accent"] =  "#00b0ff",
	["light-blue-700-accent"] =  "#0091ea",
	["cyan"] =  "#00bcd4",
	["cyan-50"] =  "#e0f7fa",
	["cyan-100"] =  "#b2ebf2",
	["cyan-200"] =  "#80deea",
	["cyan-300"] =  "#4dd0e1",
	["cyan-400"] =  "#26c6da",
	["cyan-500"] =  "#00bcd4",
	["cyan-600"] =  "#00acc1",
	["cyan-700"] =  "#0097a7",
	["cyan-800"] =  "#00838f",
	["cyan-900"] =  "#006064",
	["cyan-100-accent"] =  "#84ffff",
	["cyan-200-accent"] =  "#18ffff",
	["cyan-400-accent"] =  "#00e5ff",
	["cyan-700-accent"] =  "#00b8d4",
	["teal"] =  "#009688",
	["teal-50"] =  "#e0f2f1",
	["teal-100"] =  "#b2dfdb",
	["teal-200"] =  "#80cbc4",
	["teal-300"] =  "#4db6ac",
	["teal-400"] =  "#26a69a",
	["teal-500"] =  "#009688",
	["teal-600"] =  "#00897b",
	["teal-700"] =  "#00796b",
	["teal-800"] =  "#00695c",
	["teal-900"] =  "#004d40",
	["teal-100-accent"] =  "#a7ffeb",
	["teal-200-accent"] =  "#64ffda",
	["teal-400-accent"] =  "#1de9b6",
	["teal-700-accent"] =  "#00bfa5",
	["green"] =  "#4caf50",
	["green-50"] =  "#e8f5e9",
	["green-100"] =  "#c8e6c9",
	["green-200"] =  "#a5d6a7",
	["green-300"] =  "#81c784",
	["green-400"] =  "#66bb6a",
	["green-500"] =  "#4caf50",
	["green-600"] =  "#43a047",
	["green-700"] =  "#388e3c",
	["green-800"] =  "#2e7d32",
	["green-900"] =  "#1b5e20",
	["green-100-accent"] =  "#b9f6ca",
	["green-200-accent"] =  "#69f0ae",
	["green-400-accent"] =  "#00e676",
	["green-700-accent"] =  "#00c853",
	["light-green"] =  "#8bc34a",
	["light-green-50"] =  "#f1f8e9",
	["light-green-100"] =  "#dcedc8",
	["light-green-200"] =  "#c5e1a5",
	["light-green-300"] =  "#aed581",
	["light-green-400"] =  "#9ccc65",
	["light-green-500"] =  "#8bc34a",
	["light-green-600"] =  "#7cb342",
	["light-green-700"] =  "#689f38",
	["light-green-800"] =  "#558b2f",
	["light-green-900"] =  "#33691e",
	["light-green-100-accent"] =  "#ccff90",
	["light-green-200-accent"] =  "#b2ff59",
	["light-green-400-accent"] =  "#76ff03",
	["light-green-700-accent"] =  "#64dd17",
	["lime"] =  "#cddc39",
	["lime-50"] =  "#f9fbe7",
	["lime-100"] =  "#f0f4c3",
	["lime-200"] =  "#e6ee9c",
	["lime-300"] =  "#dce775",
	["lime-400"] =  "#d4e157",
	["lime-500"] =  "#cddc39",
	["lime-600"] =  "#c0ca33",
	["lime-700"] =  "#afb42b",
	["lime-800"] =  "#9e9d24",
	["lime-900"] =  "#827717",
	["lime-100-accent"] =  "#f4ff81",
	["lime-200-accent"] =  "#eeff41",
	["lime-400-accent"] =  "#c6ff00",
	["lime-700-accent"] =  "#aeea00",
	["yellow"] =  "#ffeb3b",
	["yellow-50"] =  "#fffde7",
	["yellow-100"] =  "#fff9c4",
	["yellow-200"] =  "#fff59d",
	["yellow-300"] =  "#fff176",
	["yellow-400"] =  "#ffee58",
	["yellow-500"] =  "#ffeb3b",
	["yellow-600"] =  "#fdd835",
	["yellow-700"] =  "#fbc02d",
	["yellow-800"] =  "#f9a825",
	["yellow-900"] =  "#f57f17",
	["yellow-100-accent"] =  "#ffff8d",
	["yellow-200-accent"] =  "#ffff00",
	["yellow-400-accent"] =  "#ffea00",
	["yellow-700-accent"] =  "#ffd600",
	["amber"] =  "#ffc107",
	["amber-50"] =  "#fff8e1",
	["amber-100"] =  "#ffecb3",
	["amber-200"] =  "#ffe082",
	["amber-300"] =  "#ffd54f",
	["amber-400"] =  "#ffca28",
	["amber-500"] =  "#ffc107",
	["amber-600"] =  "#ffb300",
	["amber-700"] =  "#ffa000",
	["amber-800"] =  "#ff8f00",
	["amber-900"] =  "#ff6f00",
	["amber-100-accent"] =  "#ffe57f",
	["amber-200-accent"] =  "#ffd740",
	["amber-400-accent"] =  "#ffc400",
	["amber-700-accent"] =  "#ffab00",
	["orange"] =  "#ff9800",
	["orange-50"] =  "#fff3e0",
	["orange-100"] =  "#ffe0b2",
	["orange-200"] =  "#ffcc80",
	["orange-300"] =  "#ffb74d",
	["orange-400"] =  "#ffa726",
	["orange-500"] =  "#ff9800",
	["orange-600"] =  "#fb8c00",
	["orange-700"] =  "#f57c00",
	["orange-800"] =  "#ef6c00",
	["orange-900"] =  "#e65100",
	["orange-100-accent"] =  "#ffd180",
	["orange-200-accent"] =  "#ffab40",
	["orange-400-accent"] =  "#ff9100",
	["orange-700-accent"] =  "#ff6d00",
	["deep-orange"] =  "#ff5722",
	["deep-orange-50"] =  "#fbe9e7",
	["deep-orange-100"] =  "#ffccbc",
	["deep-orange-200"] =  "#ffab91",
	["deep-orange-300"] =  "#ff8a65",
	["deep-orange-400"] =  "#ff7043",
	["deep-orange-500"] =  "#ff5722",
	["deep-orange-600"] =  "#f4511e",
	["deep-orange-700"] =  "#e64a19",
	["deep-orange-800"] =  "#d84315",
	["deep-orange-900"] =  "#bf360c",
	["deep-orange-100-accent"] =  "#ff9e80",
	["deep-orange-200-accent"] =  "#ff6e40",
	["deep-orange-400-accent"] =  "#ff3d00",
	["deep-orange-700-accent"] =  "#dd2c00",
	["brown"] =  "#795548",
	["brown-50"] =  "#efebe9",
	["brown-100"] =  "#d7ccc8",
	["brown-200"] =  "#bcaaa4",
	["brown-300"] =  "#a1887f",
	["brown-400"] =  "#8d6e63",
	["brown-500"] =  "#795548",
	["brown-600"] =  "#6d4c41",
	["brown-700"] =  "#5d4037",
	["brown-800"] =  "#4e342e",
	["brown-900"] =  "#3e2723",
	["grey"] =  "#9e9e9e",
	["grey-50"] =  "#fafafa",
	["grey-100"] =  "#f5f5f5",
	["grey-200"] =  "#eeeeee",
	["grey-300"] =  "#e0e0e0",
	["grey-400"] =  "#bdbdbd",
	["grey-500"] =  "#9e9e9e",
	["grey-600"] =  "#757575",
	["grey-700"] =  "#616161",
	["grey-800"] =  "#424242",
	["grey-900"] =  "#212121",
	["blue-grey"] =  "#607d8b",
	["blue-grey-50"] =  "#eceff1",
	["blue-grey-100"] =  "#cfd8dc",
	["blue-grey-200"] =  "#b0bec5",
	["blue-grey-300"] =  "#90a4ae",
	["blue-grey-400"] =  "#78909c",
	["blue-grey-500"] =  "#607d8b",
	["blue-grey-600"] =  "#546e7a",
	["blue-grey-700"] =  "#455a64",
	["blue-grey-800"] =  "#37474f",
	["blue-grey-900"] =  "#263238",
}
generic_grays = {
	["gray-10"] =  '#aaaaaa',
	["gray-15"] =  '#a3a3a3',
	["gray-20"] =  '',
	["gray-25"] =  '#999999',
	["gray-30"] =  '',
	["gray-35"] =  '',
	["gray-40"] =  '',
	["gray-45"] =  '',
	["gray-50"] =  '',
	["gray-55"] =  '#555555',
	["gray-60"] =  '',
	["gray-65"] =  '',
	["gray-70"] =  '',
	["gray-75"] =  '',
	["gray-80"] =  '',
	["gray-85"] =  '#333333',
	["gray-90"] =  '',
	["gray-95"] =  '#222222',
	["gray-100"] =  '',
}

indent_highlights = {
  ["indent-10"] = '#333333',
  ["indent-15"] = '#3c3c3c',
  ["indent-20"] = '#3f3f3f',
  ["indent-25"] = '#444444',
  ["indent-30"] = '#4c4c4c',
  ["indent-35"] = '#4f4f4f',
  ["indent-40"] = '#555555',
  ["indent-45"] = '#5c5c5c',
  ["indent-50"] = '#5f5f5f',
  ["indent-55"] = '#666666',
  ["indent-60"] = '#6c6c6c',
  ["indent-65"] = '#6f6f6f',
  ["indent-70"] = '#777777',
  ["indent-75"] = '#7c7c7c',
  ["indent-80"] = '#7f7f7f',
  ["indent-85"] = '#888888',
  ["indent-90"] = '#8c8c8c',
  ["indent-95"] = '#8f8f8f',
  ["indent-100"] = '#999999',
  ["indent-105"] = '#9c9c9c',
  ["indent-110"] = '#9f9f9f',
}

--if os.getenv("THEME_VARIANT") == 'light' then
  for i, color in ipairs(colors) do
    colors[i] = utils.invert_hex_color(color)
  end
  for i, color in ipairs(indent_highlights) do
    indent_highlights[i] = utils.invert_hex_color(color)
  end
--end

-- Italic comments
set_hl(0, 'Comment', { bg = 'None', fg = colors['gray-55'], italic = true })
set_hl(0, 'SpellBad', { undercurl = true, sp = colors['gray-55'] })
set_hl(0, 'SpellRare', { undercurl = true, sp = colors['gray-25'] })
set_hl(0, 'SpellCap', { undercurl = true, sp = colors['gray-10'] })
set_hl(0, 'SpellLocal', { undercurl = true, sp = colors['gray-55'] })

set_hl(0, 'VertSplit', { bg = 'None', fg= colors['gray-95'] })
set_hl(0, 'PmenuBorder', { fg = colors['gray-85'], ctermfg = 'gray', bg = 'None', ctermbg = 'None' })
set_hl(0, 'FloatBorder', { fg = colors['gray-85'], ctermfg = 'gray', bg = 'None', ctermbg = 'None' })

-- Invisiblish pane separators
set_hl(0, 'VertSplit', { fg = colors['gray-95'], bg = 'None', ctermfg = 'black', ctermbg = 'None' })

-- LspInfo
set_hl(0, 'LspInfoBorder', { fg = colors['gray-95'], ctermfg = 'gray', bg = 'None', ctermbg = 'None' })

-- Git signs column plugin
set_hl(0, 'GitSignsAdd', { fg = 'SpringGreen2', bg = 'None' })
set_hl(0, 'GitSignsChange', { fg = 'MediumPurple2', bg = 'None' })
set_hl(0, 'GitSignsDelete', { fg = 'Red1', bg = 'None' })

-- Cursorline
set_hl(0, 'CursorLine', { bg = colors['grey-800'] })
set_hl(0, 'CursorLineNr', { bg = colors['gray-85'], fg = 'orange' }) -- Also highlight number column

-- Folds
set_hl(0, 'Folded', { bg =  'None', fg = colors['gray-85'], bold = false, nocombine = true })

-- IndentLines
--IndentBlanklineContextStart, { sp = '#3a3a3a', underline = true }, --underline
set_hl(0, 'IndentBlanklineContextChar', { fg = colors['gray-15'], nocombine = true }) -- Active context colo
for i, v in ipairs(indent_highlights) do
  set_hl(0, 'IndentBlanklineIndent' .. tostring(v), { fg = indent_highlights[i], nocombine = true })
end

-- Highlight current row in NORMAL mode,
-- hide highlight in INSERT mode
autocmd({ 'InsertEnter', 'InsertLeave' }, { pattern = '*', command = 'set cul!' })
