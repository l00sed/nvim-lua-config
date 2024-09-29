local g = vim.g
local o = vim.o
local opt = vim.opt
local w = vim.w
local wo = vim.wo
local ft = vim.filetype
local D = vim.diagnostic
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

-- Fix bug in vim to properly interpret RGB values.
cmd [[let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"]]
cmd [[let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"]]

-- add additional filetype support
ft.add({
  extension = {
    mdx = 'mdx'
  }
})

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
o.autoread                    = true
o.swapfile                    = false
 -- Prevents an annoying "Press ENTER or type command to continue" message on any buffer event
o.dir                         = "~/tmp"
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
opt.spelllang                 = "en_us"
opt.completeopt               = "menuone,noinsert,noselect"
o.wildmode                    = "longest,full" -- Display auto-complete in Command Mode
o.timeoutlen                  = 200
o.updatetime                  = 200 -- Delay until write to Swap and HoldCommand event
w.colorcolumn                 = [[NONE]]
-- The '-ic' flag allows you to use bash aliases in the Vim "!" prompt,
-- commented out because it does nasty things to Neovim's startup time
--o.shellcmdflag                = '-ic'
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
