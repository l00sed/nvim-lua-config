local g = vim.g
local o = vim.o
local w = vim.w
local wo = vim.wo
local D = vim.diagnostic
local cmd = vim.cmd

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

-- transparency
g.transparent_enabled         = true
g.do_file_type_lua            = 1
-- leader
g.mapleader                   = " "
g.maplocalleader              = " "
-- Visual
o.conceallevel                = 2 -- pretty markdown
o.cmdheight                   = 1 -- hide vim command line
o.foldmethod                  = "indent"
o.foldopen                    = "block,hor,mark,percent,quickfix,search,tag,undo"
o.formatoptions               = "l"
o.lbr                         = true
o.pumheight                   = 10
o.showmode                    = false
o.showtabline                 = 2 -- Always show tabline
o.title                       = true
o.termguicolors               = true -- Use true colors, required for some plugins
o.virtualedit                 = "onemore"
o.wrap                        = true
-- Set transparency of pop-up
o.pumblend                    = 0
o.winblend                    = 0
-- Behaviour
o.clipboard                   = [[unnamed,unnamedplus]] -- Makes neovim and host OS clipboard play nice
o.hlsearch                    = false
o.history                     = 10000
o.redrawtime                  = 10000
o.swapfile                    = false
o.backup                      = false
o.writebackup                 = false
o.ignorecase                  = true -- Ignore case when using lowercase in search
o.incsearch                   = true
o.smartcase                   = true -- But don't ignore it when using upper case
o.smarttab                    = true
o.smartindent                 = true
o.breakindentopt              = [[shift:0,min:40,sbr]]
o.expandtab                   = true -- Convert tabs to spaces.
o.tabstop                     = 2
o.softtabstop                 = 2
o.shiftwidth                  = 2
o.splitbelow                  = true
o.splitright                  = true
o.scrolloff                   = 12 -- Minimum offset in lines to screen borders
o.sidescroll                  = 1
o.sidescrolloff               = 12
o.mouse                       = 'a' -- Mouse
o.lazyredraw                  = true
o.hidden                      = true -- Do not save when switching buffers
o.encoding                    = "utf-8"
o.fileencoding                = "utf-8"
o.spell                       = true
o.ls                          = 2
o.shortmess                   = "c"
o.spelllang                   = "en_us"
o.completeopt                 = "menuone,noinsert,noselect"
o.wildmode                    = "longest,full" -- Display auto-complete in Command Mode
o.timeoutlen                  = 500
o.updatetime                  = 200 -- Delay until write to Swap and HoldCommand event
w.colorcolumn                 = [[NONE]]
wo.number                     = true
wo.relativenumber             = false
wo.signcolumn                 = 'yes'
wo.cursorline                 = true
-- Enable blinking together with different cursor shapes for insert/command mode, and cursor highlighting:
o.guicursor                   = 'n-v-c:block,'..
                                'i-ci-ve:ver25,'..
                                'r-cr:hor20,'..
                                'o:hor50,'..
                                'a:blinkwait100-blinkoff200-blinkon150-Cursor/lCursor,'..
                                'sm:block-blinkwait175-blinkoff150-blinkon175'

-- No fold enabled
cmd [[au FileType lazy set nofen]]
-- Invisiblish pane separators
cmd [[
set fillchars=vert:\???
hi! VertSplit guifg=#010101 guibg=NONE ctermfg=black ctermbg=NONE
]]
-- Italic comments
cmd [[highlight Comment cterm=italic gui=italic]]
-- Extra HTML syntax highlighting
cmd [[hi htmlArg cterm=italic]]
cmd [[hi htmlBold cterm=bold gui=bold]]
cmd [[hi htmlItalic cterm=italic gui=italic]]
cmd [[hi htmlBoldItalic cterm=bold,italic gui=bold,italic]]
-- Python set tab instead of spaces
cmd [[au FileType python set sw=4 ts=4 sts=4 expandtab]]
-- Javascript tab instead of spaces
cmd [[au FileType javascript set sw=2 ts=2 sts=2]]
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
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,README.md  setf markdown
au FileType markdown setl breakindent tw=0 wrap lbr
au FileType php setl breakindent
au FileType html setl breakindent
au FileType json setl breakindent
au FileType js setl breakindent
]]
-- Set filetype to bash for .zsh-theme
cmd [[au BufNewFile,BufRead *.zsh-theme setf bash]]
-- JSON
cmd [[au FileType json setl breakindent]]
-- JS
cmd [[au FileType js setl breakindent]]


-- Highlight current row in NORMAL mode,
-- hide highlight in INSERT mode
cmd [[autocmd InsertEnter,InsertLeave * set cul!]]

cmd [[filetype plugin indent on]]

-- Python providers
local pynvim_env  = "/.local/bin/pyenv/versions/pynvim/"
python3_host_prog = os.getenv("HOME") .. pynvim_env .. "/bin/python"
black_virtualenv  = os.getenv("HOME") .. pynvim_env

-- Disable unused providers
loaded_perl_provider = 0
loaded_ruby_provider = 0

-- Diagnostics
D.config {
  -- Disable inline error messages
  virtual_text = false,
  underline = false,
  signs = true, -- Keep gutter signs
}
