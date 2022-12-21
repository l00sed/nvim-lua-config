-- Plugin definition and loading
-- local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

-- Bootstrap Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Load Packer
cmd([[packadd packer.nvim]])
-- Rerun PackerCompile everytime plugins.lua is updated
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Initialize plugins
return require('packer').startup(function(use)
  -- Let Packer manage itself
  use({ 'wbthomason/packer.nvim', opt = true })

  -- LSP Installer and Config (using mason)
  use({
    'williamboman/mason.nvim', -- Helper for installing most language servers
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    run = require('plugins.mason.mason')
  })

  use({
    's1n7ax/nvim-search-and-replace',
    config = function() require'nvim-search-and-replace'.setup({
      ignore = {'**/node_modules/**', '**/.git/**', '**/.gitignore', '**/.gitmodules', '**/__pycache__/**'},
    }) end,
  })

  -- Autocomplete
  use({
    "hrsh7th/nvim-cmp",
    -- Sources for nvim-cmp
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function() require('plugins.cmp') end,
  })

  -- Colorizer
  use({
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer') end,
    run = require'colorizer'.setup({
      '*';
    }, {
      RGB      = true,   -- #RGB hex codes
      RRGGBB   = true,   -- #RRGGBB hex codes
      names    = true,   -- "Name" codes like Blue
      RRGGBBAA = true,  -- #RRGGBBAA hex codes
      rgb_fn   = true,  -- CSS rgb() and rgba() functions
      hsl_fn   = true,  -- CSS hsl() and hsla() functions
      css      = true,  -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn   = true,  -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- Available modes: foreground, background
      mode     = 'background' -- Set the display mode.
    }),
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end,
    run = ':TSUpdate'
  })

  -- Snippets
  use { "L3MON4D3/LuaSnip", config = function() require('plugins.snippets') end }
  use "rafamadriz/friendly-snippets"

  -- Signature help
  use "ray-x/lsp_signature.nvim"

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function() require('plugins.telescope') end,
  })

  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

  -- bufferline
  use({
    'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function() require('plugins.bufferline') end,
    event = 'BufWinEnter',
  })

  -- statusline
  use({
    'hoob3rt/lualine.nvim',
    config = function() require('plugins.lualine.lualine') end,
  })

  -- For Tmux NvimTree usage
  use 'kiyoon/tmuxsend.vim'
  -- Seamless Vim + Tmux navigation
  use 'christoomey/vim-tmux-navigator'
  -- Like Tmux <C-b>z
  use 'caenrique/nvim-maximize-window-toggle'

  -- NvimTree
  use({
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function() require('plugins.nvimtree') end, -- Must add this manually
  })

  -- Startify
  use({
    'mhinz/vim-startify',
    config = function()
      local path = vim.fn.stdpath('config')..'/lua/plugins/startify.lua'
      vim.cmd('source ' .. path)
    end
  })

  -- git commands
  use 'tpope/vim-fugitive'
  -- tmux
  use 'edkolev/tmuxline.vim'

  -- Gitsigns
  use({
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.gitsigns') end
  })

  -- :w !sudo tee %
  use 'lambdalisue/suda.vim'

  -- Formatting
  -- -- Nice indent formatting utilities
  use 'godlygeek/tabular'
  use 'Yggdroot/indentLine'
  -- -- tpope
  use 'tpope/vim-commentary'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  -- -- easy-align
  use 'junegunn/vim-easy-align'
  -- -- React / JS
  use 'maksimr/vim-jsbeautify'
  use 'othree/javascript-libraries-syntax.vim'
  use 'pangloss/vim-javascript'
  use 'leafgarland/typescript-vim'
  use 'mxw/vim-jsx'
  use 'peitalin/vim-jsx-typescript'
  use 'othree/yajs.vim'
  -- -- Django
  use 'tweekmonster/django-plus.vim'
  -- -- Python formatting
  use "EgZvor/vim-black"
  use 'jeetsukumaran/vim-python-indent-black'
  -- -- PHP
  use '2072/PHP-Indenting-for-VIm'
  -- -- CSS
  use 'hail2u/vim-css3-syntax'
  -- -- Markdown
  use 'tpope/vim-markdown'
  -- Python
  -- use  'heavenshell/vim-pydocstring'   -- Overwrites a keymap, need to fix.
  -- use 'bfredl/nvim-ipy'

  -- TOML Files
  use 'cespare/vim-toml'

  -- Markdown ToC
  use 'mzlogin/vim-markdown-toc'

  -- Poetry
  -- use({'petobens/poet-v',
  --   config = function()
  --     local path = vim.fn.stdpath('config')..'/lua/plugins/poet-v.vim'
  --     vim.cmd('source '..path)
  --   end
  -- })

  -- Shows lines pointing to offending errors inline
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })

  -- Documentation Generator (jsDoc, etc.)
  use({
    'kkoomen/vim-doge',
    run = ':call doge#install()'
  })

  -- Smooth Scrolling
  use({
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end,
  })

  -- Themes
  use 'folke/tokyonight.nvim'
  use 'marko-cerovac/material.nvim'

  use({
    'ellisonleao/gruvbox.nvim',
    config = function()
      require('gruvbox').setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = true,
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = false, -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = true,
        transparent_mode = true,
      })
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
