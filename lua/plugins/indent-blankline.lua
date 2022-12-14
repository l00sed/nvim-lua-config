local g = vim.g
local api = vim.api
local cmd = vim.cmd

g.indent_blankline_char_list = {
  '│',
  '-',
  '│',
  '-',
  '│',
  '-',
  '│',
  '-',
  '│',
  '-',
  '│',
  '-',
  '│',
  '-',
}

g.indent_blankline_context_patterns = {
  "class",
  "^func",
  "method",
  "^if",
  "^else",
  "^elif",
  "while",
  "for",
  "with",
  "try",
  "except",
  "arguments",
  "argument_list",
  "object",
  "dictionary",
  "element",
  "table",
  "tuple",
  "do_block",
  "export",
  "const",
  "<?php",
}
-- ignore the above list and use treesitter instead
--g.indent_blankline_use_treesitter_scope = true

g.indent_blankline_buftype_exclude = {
  'help',
  'terminal',
  'nofile',
  'quickfix',
  'prompt',
}

g.indent_blankline_bufname_exclude = {
  'packer',
  'startify',
}

g.indent_blankline_filetype_exclude = {
  'lspinfo',
  'packer',
  'checkhealth',
  'help',
  'man',
  '',
}

highlights = {}
for i=1,21,1 do
  highlights[i] = "IndentBlanklineIndent" .. i
end

require("indent_blankline").setup({
  space_char_blankline = " ",
  show_current_context = true,
  --show_current_context_start = true,
  char_highlight_list = highlights
})

