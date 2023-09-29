local set_hl = vim.api.nvim_set_hl
local utils = require('utils')

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
  '#acacac',
  '#bcbcbc',
  '#cccccc',
  '#dcdcdc',
  '#ececec',
  '#fcfcfc',
}

if os.getenv("THEME_VARIANT") == 'light' then
  for i, color in ipairs(indent_highlights) do
    indent_highlights[i] = utils.invert_hex_color(color)
  end
end

-- IndentLines
set_hl(0, 'IndentBlanklineContextStart', { sp = indent_highlights[3], underline = true }) --underline
set_hl(0, 'IndentBlanklineContextChar', { fg = indent_highlights[10], nocombine = true }) -- Active context colo
for i, hl in ipairs(indent_highlights) do
  set_hl(0, 'IndentBlanklineIndent' .. i, { fg = hl, nocombine = true })
end

highlights = {}
for i=1,21,1 do
  highlights[i] = "IndentBlanklineIndent" .. i
end

vim.opt.list = false

require("ibl").setup({
  indent = {
    char = { "│", "-" },
    highlight = highlights,
    smart_indent_cap = false
  },
  scope = {
    char = "│",
    highlight = highlights[table.getn(highlights)],
    show_start = false,
    show_end = false,
  },
  exclude = {
    filetypes = {
      'lspinfo',
      'packer',
      'lazy',
      'startify',
      'checkhealth',
      'help',
      'man',
      'gitcommit',
      'TelescopePrompt',
      'TelescopeResults',
      '',
    },
    buftypes = {
      'terminal',
      'nofile',
      'quickfix',
      'prompt',
      'help',
      'packer',
    }
  }
})
