-- Define commands
local cmd = vim.cmd

-- Underline / Undercurl
cmd [[
if &term =~ 'xterm\|kitty\|alacritty\|tmux'
    let &t_Ts = "\e[9m"   " Strikethrough
    let &t_Te = "\e[29m"
    let &t_Cs = "\e[4:3m" " Undercurl
    let &t_Ce = "\e[4:0m"
endif
]]

-- Remove trailing whitespaces
-- (if a file requires trailing spaces, exclude its type using the regex)
cmd [[autocmd BufWritePre * %s/\s\+$//e ]]

-- Swap folder
cmd('command! ListSwap split | enew | r !ls -l ~/.local/share/nvim/swap')
cmd('command! CleanSwap !rm -rf ~/.local/share/nvim/swap/')

-- Open help tags
cmd("command! HelpTags Telescope help_tags")

-- Create ctags
cmd('command! MakeCTags !ctags -R --exclude=@.ctagsignore .')

-- Syntax highlighting autocmds
-- -- JS/JSX/TS
cmd [[
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
]]
cmd [[autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart]]
cmd [[autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear]]
-- -- JSON
cmd [[autocmd FileType json syntax match Comment +\/\/.\+$+]]
-- -- Django
cmd [[au BufNewFile,BufRead *.html set filetype=htmldjango]]
-- -- Indent wrapped lines
cmd [[
set breakindentopt=shift:0,min:40,sbr
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,README.md  setf markdown
au FileType markdown setl breakindent
au FileType markdown setl textwidth=0
au FileType markdown setl wrap
au FileType markdown setl linebreak  " wrap line at word boundaries
au FileType php setl breakindent
au FileType html setl breakindent
au FileType json setl breakindent
au FileType js setl breakindent
au User Startified setl breakindent
]]
-- -- CSS
cmd [[
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END
]]
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
endfunction
augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
]]
