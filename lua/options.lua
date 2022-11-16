local g = vim.g
local o = vim.o
local w = vim.w
local wo = vim.wo
local D = vim.diagnostic
local A = vim.api
local cmd = vim.cmd

-- Visual
o.conceallevel    = 2 -- pretty markdown
o.cmdheight       = 1
o.pumheight       = 10
o.showmode        = false
o.showtabline     = 2 -- Always show tabline
o.title           = true
o.termguicolors   = true -- Use true colors, required for some plugins

-- Change cursor shape based on mode
cmd[[
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
]]
-- Fix bug in vim.
cmd [[set t_8f=^[[38;2;%lu;%lu;%lum]]
cmd [[set t_8b=^[[48;2;%lu;%lu;%lum]]
o.wrap            = true
o.virtualedit     = "onemore"
o.formatoptions   = "l"
o.lbr             = true
-- o.foldmethod      = "indent"
wo.number         = true
wo.relativenumber = false
wo.signcolumn     = 'yes'
wo.cursorline     = true
w.colorcolumn     = [[NONE]]
-- transparency
-- Set transparency of pop-up
o.pumblend = 10
o.winblend = 10
g.transparent_enabled = false
g.airline_powerline_fonts = 1
-- Fix conceallevel when using Yggdroot/indentLine plugin
cmd [[
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=2
]]
-- Indentline Settings
cmd [[
"autocmd VimEnter,WinEnter,BufNewFile,BufRead,BufEnter,TabEnter * IndentLinesReset
"set listchars=tab:\│\ ,trail:\
let g:indentLine_setColors=1
let g:indentLine_enabled=1
let g:indentLine_char_list=['│', '-']
]]
cmd [[hi cursorline cterm=none term=none]]
cmd [[autocmd WinEnter * setlocal cursorline]]
cmd [[autocmd WinLeave * setlocal nocursorline]]
-- Italic comments
cmd [[highlight Comment cterm=italic gui=italic]]
-- Extra HTML syntax highlighting
cmd [[highlight htmlArg cterm=italic]]
cmd [[highlight htmlBold cterm=bold gui=bold]]
cmd [[highlight htmlItalic cterm=italic gui=italic]]
cmd [[highlight htmlBoldItalic cterm=bold,italic gui=bold,italic]]
-- Invisiblish pane separators
cmd [[
set fillchars=vert:\│
hi! VertSplit guifg=black guibg=NONE ctermfg=black ctermbg=NONE
]]


-- Behaviour
o.clipboard     = [[unnamed,unnamedplus]] -- Makes neovim and host OS clipboard play nice
o.hlsearch      = false
o.history       = 10000
o.redrawtime    = 10000
o.swapfile      = false
o.backup        = false
o.writebackup   = false
o.ignorecase    = true -- Ignore case when using lowercase in search
o.incsearch     = true
o.smartcase     = true -- But don't ignore it when using upper case
o.smarttab      = true
o.smartindent   = true
o.breakindentopt=[[shift:0,min:40,sbr]]
o.expandtab     = true -- Convert tabs to spaces.
o.tabstop       = 2
o.softtabstop   = 2
o.shiftwidth    = 2
-- Python set 4
cmd [[au FileType python set sw=4 ts=4 sts=4]]
-- Javascript tab instead of spaces
cmd [[au FileType javascript setl smartindent noexpandtab sw=2 sts=2 ts=2]]
-- Markdown
cmd [[au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,README.md  setf markdown]]
cmd [[au FileType markdown setl breakindent tw=0 wrap lbr]]
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
augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
]]
-- HTML
cmd [[au FileType html setl breakindent]]
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
-- JSON
cmd [[au FileType json setl breakindent]]
-- JS
cmd [[au FileType js setl breakindent]]
-- Startify
cmd [[au User Startified setl breakindent]]

o.splitbelow    = true
o.splitright    = true
o.scrolloff     = 12 -- Minimum offset in lines to screen borders
o.sidescroll    = 1
o.sidescrolloff = 12
o.mouse         = 'a'
o.lazyredraw    = true
-- Highlight current row in NORMAL mode,
-- hide highlight in INSERT mode
cmd [[autocmd InsertEnter,InsertLeave * set cul!]]

-- Vim specific
o.hidden           = true -- Do not save when switching buffers
o.encoding         = "utf-8"
o.fileencoding     = "utf-8"
o.spell            = true
o.ls               = 2
o.shortmess        = "c"
o.spelllang        = "en_us"
o.completeopt      = "menuone,noinsert,noselect"
o.wildmode         = "longest,full" -- Display auto-complete in Command Mode
o.timeoutlen       = 500
o.updatetime       = 200 -- Delay until write to Swap and HoldCommand event
g.do_file_type_lua = 1
cmd [[filetype plugin indent on]]

-- Disable default plugins
-- vim.g.loaded_netrwPlugin = false                     -- This had an issue but I can't remember now.

-- Python providers
local pynvim_env  = "/.local/bin/pyenv/versions/pynvim/"
python3_host_prog = os.getenv("HOME") .. pynvim_env .. "/bin/python"
black_virtualenv  = os.getenv("HOME") .. pynvim_env

-- Disable unused providers
loaded_perl_provider = 0
loaded_ruby_provider = 0

-- Disable inline error messages
D.config {
  virtual_text = false,
  underline = false,
  signs = true, -- Keep gutter signs
}
