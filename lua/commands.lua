-- Alias some globals
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local command = vim.api.nvim_create_user_command
local set_hl = vim.api.nvim_set_hl

-- Disable default commands (uses CTRL modifier)
cmd[[let g:tmux_navigator_no_mappings = 1]]
cmd[[let g:tmux_resizer_no_mappings = 1]]

-- Underline / Undercurl
cmd [[
if &term =~ 'xterm\|kitty\|alacritty\|tmux'
  let &t_Ts="\e[9m"   " Strikethrough
  let &t_Te="\e[29m"
  let &t_Cs="\e[4:3m" " Undercurl
  let &t_Ce="\e[4:0m"
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
endif
]]

-- Record the buffer number (set global "lastBufName")
-- when closed, so that it may be reopened with :Last
local reopen = augroup('Reopen', { clear = true })
autocmd('BufLeave', {
  group = reopen,
  command = 'let g:lastBufName = @%'
})

-- Reopen the last closed buffer with :Last
cmd [[
function! RessurrectLast()
  exe "tabnew " . g:lastBufName
endfunction
command -nargs=0 Last call RessurrectLast()
]]

-- Remove trailing whitespaces
-- (if a file requires trailing spaces, exclude its type using the regex)
autocmd('BufWritePre', { pattern = '*', command = [[%s/\s\+$//e]] })

-- Set "messages" syntax for these log files
autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*messages*',
  command = 'setf messages'
})

-- No fold enabled
autocmd('FileType', {
  pattern = { 'lazy', 'TelescopePrompt', 'TelescopeResults' },
  command = 'set nofen'
})

-- Python set tab instead of spaces
autocmd('FileType', {
  pattern = 'python',
  command = 'set sw=4 ts=4 sts=4 expandtab'
})

-- Javascript tab instead of spaces
autocmd('FileType', {
  pattern = 'javascript',
  command = 'set sw=2 ts=2 sts=2'
})

-- -- PHP
cmd [[
function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
  syn match phpParentOnly "[()]" contained containedin=phpParent
  hi phpParentOnly guifg=#f08080 guibg=NONE gui=NONE
  hi phpUseNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
  hi phpClassNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
  setl ts=2 sts=2 noet | retab! | setl ts=2 sts=2 et | retab
endfunction
]]

local php_group = augroup('PHPGroup', { clear = true })
autocmd({ 'BufNewFile', 'BufRead' }, {
  group = php_group,
  pattern = '*.php',
  command = 'call PhpSyntaxOverride()'
})

-- Syntax highlighting autocmds
-- -- JS/JSX/TS
local jsx_group = augroup('JSXGroup', { clear = true })
autocmd('BufWinEnter', {
  group = jsx_group,
  pattern = '*.jsx',
  command = 'set filetype=javascriptreact'
})
autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.{js,jsx,ts,tsx}', command = ':syntax sync fromstart'
})
autocmd('BufLeave', {
  pattern = '*.{js,jsx,ts,tsx}', command = ':syntax sync clear'
})

-- -- JSON
autocmd('FileType', {
  pattern = 'json', command = ':syntax match Comment +\\/\\/.\\+$+'
})

-- -- Django
autocmd('BufWinEnter', {
  pattern = '*.html', command = 'setf htmldjango'
})
autocmd('FileType', {
  pattern = 'htmldjango', command = 'set sw=2 ts=2 sts=2'
})

-- -- Indent wrapped lines for markdown
autocmd('BufWinEnter', {
  pattern = {
    '*.markdown',
    '*.mdown',
    '*.mkd',
    '*.mkdn',
    '*.mdwn',
    'README.md'
  },
  command = 'setf markdown'
})

autocmd('FileType', {
  pattern = 'markdown',
  command = 'setl breakindent tw=0 wrap lbr sw=2 ts=2 sts=2'
})

-- Set filetype to bash for .zsh-theme
autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.zsh-theme', command = 'setf bash'
})

-- JS, JSON
autocmd('FileType', {
  pattern = { 'js', 'json', 'php', 'html' }, command = 'setl breakindent'
})

-- Indent on for "plugin" filetype
autocmd('FileType', { pattern = 'plugin', command = 'indent on' })

-- Fixes issue with broken syntax highlighting when hiding and revealing buffers
autocmd({ 'BufEnter' }, {
  command = 'syntax sync fromstart'
})

-- Swap folder
command('ListSwap', 'split | enew | r !ls -l ~/.local/share/nvim/swap', { bang = true })
command('CleanSwap', '!rm -rf ~/.local/share/nvim/swap/', { bang = true })

-- Open help tags
command('HelpTags', 'Telescope help_tags', { bang = true })

-- Create ctags
command('MakeCTags', '!ctags -R --exclude=@.ctagsignore .', { bang = true })

-- Make write (and write-quit) case insensitive
command('W', 'w', { bang = true })
command('Wq', 'wq', { bang = true })
command('WQ', 'wq', { bang = true })
command('Q', 'q', { bang = true })

-- Override colorscheme command
command('ThemeLight', 'colorscheme Tomorrow | so ~/.config/nvim/lua/plugins/indent-blankline.lua', { bang = true })

-- More Tmux-like magic
cmd [[
function! ConfirmQuit(writeFile)
  if (a:writeFile)
    if (expand('%:t')=="")
      echo "Can't save a file with no name."
      return
    endif
    :write
  endif

  if (winnr('$')==1 && tabpagenr('$')==1)
    if (confirm("Do you really want to quit?", "&Yes\n&No", 2)==1)
      :quit
    endif
  else
    :quit
  endif
endfu
]]
