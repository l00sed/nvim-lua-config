local g = vim.g
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
}
g.indent_blankline_context_patterns = {
  "class",
  "^func",
  "method",
  "^if",
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
  "const",
  "<?php",
}
g.indent_blankline_use_treesitter_scope = true
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

require("indent_blankline").setup({
  space_char_blankline = " ",
  show_current_context = true,
  --show_current_context_start = true,
})

