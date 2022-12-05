-- Plugin definition and loading
-- local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

-- Bootstrap Packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
end

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
    -- config = function() require('plugins.colorizer') end,
    run = require'colorizer'.setup(),
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
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.bufferline') end,
    event = 'BufWinEnter',
  })

  -- statusline
  use({
    'hoob3rt/lualine.nvim',
    config = function() require('plugins.lualine.lualine') end,
  })

  -- NvimTree
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.nvimtree') end, -- Must add this manually
  })

  -- Startify
  use({
    'mhinz/vim-startify',
    config = function()
      local path = vim.fn.stdpath('config')..'/lua/plugins/startify.vim'
      vim.cmd('source '..path)
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
  -- Syntax
  use 'sheerun/vim-polyglot'
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

  use 'christoomey/vim-tmux-navigator'

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

  if packer_bootstrap then
    require('packer').sync()
  end
end)
