local g = vim.g
local o = vim.o
local w = vim.w
local wo = vim.wo
local D = vim.diagnostic
local A = vim.api
local cmd = vim.cmd

-- Visual
o.conceallevel    = 0 -- Don't hide quotes in markdown
o.cmdheight       = 1
o.pumheight       = 10
o.showmode        = false
o.showtabline     = 2 -- Always show tabline
o.title           = true
o.termguicolors   = true -- Use true colors, required for some plugins
-- Fix bug in vim.
cmd [[set t_8f=^[[38;2;%lu;%lu;%lum]]
cmd [[set t_8b=^[[48;2;%lu;%lu;%lum]]
o.wrap            = true
o.virtualedit     = "onemore"
o.formatoptions   = "l"
o.lbr             = true
o.foldmethod      = "indent"
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
cmd [[autocmd FileType python set sw=4]]
cmd [[autocmd FileType python set ts=4]]
cmd [[autocmd FileType python set sts=4]]
-- Javascript tab instead of spaces
cmd [[autocmd FileType javascript setlocal smartindent noexpandtab shiftwidth=2 tabstop=2]]
-- Markdown
cmd [[au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,README.md  setf markdown]]
cmd [[au FileType markdown setl breakindent]]
cmd [[au FileType markdown setl textwidth=0]]
cmd [[au FileType markdown setl wrap]]
cmd [[au FileType markdown setl linebreak]] -- wrap lines at word breaks
-- PHP
cmd [[au FileType php setl breakindent]]
-- HTML
cmd [[au FileType html setl breakindent]]
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
o.encoding         = "utf8"
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
