local g = vim.g
local cmd = vim.cmd

-- Indentline Settings
cmd [[
if exists(":IndentLinesReset")
  autocmd VimEnter,WinEnter,BufNewFile,BufRead,BufEnter,TabEnter * IndentLinesReset
endif
]]
-- Fix conceallevel when using Yggdroot/indentLine plugin
g.indentLine_concealcursor = ""
g.indentLine_conceallevel = 2
g.indentLine_setColors = 1
g.indentLine_enabled = 1
g.indentLine_char_list = {
  '│',
  '-',
}
g.indentLine_bufTypeExclude = {
  'help',
  'terminal',
}
g.indentLine_bufNameExclude = {
  'packer',
  'startify',
}
