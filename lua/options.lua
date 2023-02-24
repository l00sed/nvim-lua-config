local g = vim.g
local o = vim.o
local opt = vim.opt
local w = vim.w
local wo = vim.wo
local D = vim.diagnostic
local cmd = vim.cmd
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Fix bug in vim to properly interpret RGB values.
cmd [[let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"]]
cmd [[let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"]]


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
o.wrap                        = false
-- Set transparency of pop-up
o.pumblend                    = 0
o.winblend                    = 0
-- Behaviour
o.clipboard                   = [[unnamed,unnamedplus]] -- Makes neovim and host OS clipboard play nice
o.hlsearch                    = true -- Highlight search results
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
o.ls                          = 2
o.shortmess                   = "c"
o.spell                       = true
opt.spelllang                   = "en_us"
opt.completeopt                 = "menuone,noinsert,noselect"
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
-- Sexy separators
--vim.opt.fillchars = {
--  stl = ' ',
--  stlnc = ' ',
--  wbr = ' ',
--  horiz = '─',
--  horizup = '┴',
--  horizdown = '┬',
--  vert = '│',
--  vertleft  = '┤',
--  vertright = '├',
--  verthoriz = '┼',
--  fold = '.',
--  foldopen = '-',
--  foldclose = '+',
--  foldsep = '│',
--  diff = '-',
--  msgsep = ' ',
--  eob = '~',
--  lastline = '@'
--}
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
autocmd({ 'BufNewFile', 'BufRead' }, {
  group = jsx_group,
  pattern = '*.jsx',
  command = 'set filetype=javascript.jsx'
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
autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.html', command = 'set filetype=htmldjango'
})
autocmd('FileType', {
  pattern = 'htmldjango', command = 'set sw=2 ts=2 sts=2'
})
-- -- Indent wrapped lines for markdown
autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.markdown', '*.mdown', '*.mkd', '*.mkdn', '*.mdwn', 'README.md' }, command = 'setf markdown'
})
autocmd('FileType', {
  pattern = 'markdown', command = 'setl breakindent tw=0 wrap lbr'
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
  -- Set lsp_lines to be hidden for the current buffer by default
  virtual_lines = false,
  -- Disable underlines on LSP
  underline = false,
  signs = true, -- Keep gutter signs
}
