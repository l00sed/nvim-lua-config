return {
  -- LSP Installer and Config (using mason)
  {
   "williamboman/mason.nvim", -- Helper for installing most language servers
   "williamboman/mason-lspconfig.nvim",
   "neovim/nvim-lspconfig",
  },

  -- Use Luarocks lua package management
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    opts = {
      rocks = { "lunajson" }, -- specifies a list of rocks to install
      luarocks_build_args = {
        "--with-lua=~/.lua/bin/lua"
      }, -- extra options to pass to luarocks's configuration script
    },
  },

  -- Fancy Markdown
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    priority = 49, -- Load before nvim-treesitter for best results
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('plugins.markview')
    end
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = "nvimtools/none-ls-extras.nvim",
    config = function()
      require("plugins.none-ls")
    end,
  },

  -- Search and replace across multiple files
  {
    "s1n7ax/nvim-search-and-replace",
    config = function()
      require("nvim-search-and-replace").setup({
        ignore = {
          "**/node_modules/**",
          "**/.git/**",
          "**/.gitignore",
          "**/.gitmodules",
          "**/__pycache__/**",
        },
      })
    end,
  },

  -- Magically delicious todo-lists
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  },

  -- DiffView.nvim
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
  },

  -- devicons in cmp menu
  "onsails/lspkind.nvim",

  -- Easy multi-file search and replace
  {
    "nvim-pack/nvim-spectre"
  },

  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    -- Sources for nvim-cmp
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "l00sed/cmp-tidal",
    },
    config = function()
      require("plugins.cmp")
    end,
  },

  -- AI coding help
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("plugins.codecompanion")
    end
  },

  {
    'github/copilot.vim',
    config = function()
      require("plugins.copilotvim")
    end
  },

  {
    "sudo-tee/opencode.nvim",
    config = function()
      require("plugins.opencode")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      'hrsh7th/nvim-cmp',
      'nvim-telescope/telescope.nvim'
    }
  },

  -- Image Viewer
  {
    "3rd/image.nvim",
    config = function()
      require("plugins.image")
    end
  },

  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({"*"}, {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = true, -- "Name" codes like Blue
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = true, -- CSS hsl() and hsla() functions
      css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- Available modes: foreground, background
      mode = "background", -- Set the display mode.
    })
    end
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- Recommended
    priority = 50, -- Load before most other plugins
    build = ':TSUpdate',
    dependencies = {
      'OXY2DEV/markview.nvim'
    },
    config = function()
      require("plugins.treesitter")
    end,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("plugins.snippets")
    end,
  },

  -- Keymap helper
  {
    "folke/which-key.nvim",
    config = function()
      require("plugins.which-key")
    end,
  },

  -- Signature help
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("plugins.lsp_signature")
    end,
  },

  -- FZF Native
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    config = function()
      require("plugins.dropbar")
    end
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    config = function()
      require("plugins.telescope")
    end,
  },

  -- Barbar.nvim (bufferline tabs)
  {
    "romgrk/barbar.nvim",
    dependencies = {
      'nvim-tree/nvim-tree.lua',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("plugins.barbar")
    end,
    event = "BufWinEnter",
  },

  -- Seamless Vim + Tmux navigation
  "christoomey/vim-tmux-navigator",
  "l00sed/vim-tmux-resizer",
  -- Like Tmux <C-b>z
  "caenrique/nvim-maximize-window-toggle",

  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.nvimtree")
    end, -- Must add this manually
  },

   -- Startify
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      require("plugins.alpha")
    end
  };

  -- git commands
  "tpope/vim-fugitive",
  -- tmux
  "edkolev/tmuxline.vim",

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = "BufWinEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.gitsigns")
    end,
  },

  -- :w !sudo tee %
  "lambdalisue/suda.vim",

  -- Formatting
  -- -- Nice indent formatting utilities
  "godlygeek/tabular",

  -- ZenMode
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 0.15,
          width = 120,
          height = 1,
          options = {
            signcolumn = "no",
            number = false,
          },
        },
        plugins = {
          options = { enabled = true },
          gitsigns = { enabled = true },
          tmux = { enabled = false },
        },
      })
    end,
  },

  -- Markdown ToC
  "mzlogin/vim-markdown-toc",

  -- Shows lines pointing to offending errors inline
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = true,
  },

  -- Show inline usage metrics
  {
    'wiliamks/nice-reference.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', --optional
      {
        'rmagatti/goto-preview',
        config = function()
          require('goto-preview').setup({})
        end
      } --optional
    },
    config = function()
      require("plugins.nice-ref")
    end
  },

  -- Smooth Scrolling
  {
    "karb94/neoscroll.nvim",
    config = true,
  },

  --{
  --  "sphamba/smear-cursor.nvim",
  --  opts = {
  --    -- Cursor color. Defaults to Cursor gui color
  --    --cursor_color = "#d3cdc3",
  --    -- Background color. Defaults to Normal gui background color
  --    normal_bg = "#111111",
  --    -- Smear cursor when switching buffers
  --    smear_between_buffers = true,
  --    -- Smear cursor when moving within line or to neighbor lines
  --    smear_between_neighbor_lines = true,
  --    -- Use floating windows to display smears outside buffers.
  --    -- May have performance issues with other plugins.
  --    --use_floating_windows = true,
  --    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
  --    -- Smears will blend better on all backgrounds.
  --    --legacy_computing_symbols_support = true,   -- How fast the smear's head moves towards the target.
  --    -- 0: no movement, 1: instantaneous, default: 0.6
  --    --stiffness = 0.6,
  --    -- How fast the smear's tail moves towards the head.
  --    -- 0: no movement, 1: instantaneous, default: 0.3
  --    --trailing_stiffness = 0.3,
  --    -- How much the tail slows down when getting close to the head.
  --    -- 0: no slowdown, more: more slowdown, default: 0.1
  --    --trailing_exponent = 0.1,
  --    -- Stop animating when the smear's tail is within this distance (in characters) from the target.
  --    -- Default: 0.1
  --    --distance_stop_animating = 0.1,
  --    -- Attempt to hide the real cursor when smearing.
  --    -- Default: true
  --    --hide_target_hack = true,
  --  }
  --},

  -- LaTeX for Vim
  {
    "lervag/vimtex",
    config = function()
      require("plugins.vimtex")
    end,
  },

  -- Excellent lua statusline
  {
    "hoob3rt/lualine.nvim",
    config = function()
      require("plugins.lualine")
    end,
  },

  -- Pretty/interactive indentlines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("plugins.indent-blankline")
    end,
  },

  -- Pretty fold
  {
    "bbjornstad/pretty-fold.nvim",
    --event = "BufWinEnter",
    config = function()
      require("plugins.pretty-fold")
    end,
  },

  -- Gruvbox theme
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,   -- Load last to ensure nothing overwrites
    priority = 100, -- Set high priority
    config = function()
      require("plugins.gruvbox")
    end,
  },

  -- TidalCycles integration
  {
    "thgrund/tidal.nvim",
    opts = {
      --- Configure TidalLaunch command
      boot = {
        tidal = {
          --- Command to launch ghci with tidal installation
          cmd = "ghci",
          args = {
            "-v0",
          },
          --- Tidal boot file path
          file = os.getenv("HOME") .. "/.config/tidal/BootTidal.hs",
          enabled = true,
          highlight = {
            autostart = true,
            styles = {
              osc = {
                ip = "127.0.0.1",
                port = 3335,
              },
              -- [Tidal ID] -> hl style
              --custom = {
              --  ["1"] = { bg = "#cc241d", foreground = "#ffffff" },
              --  ["2"] = { bg = "#d65d0e", foreground = "#ffffff" },
              --  ["3"] = { bg = "#d78821", foreground = "#000000" },
              --  ["4"] = { bg = "#b8bb26", foreground = "#000000" },
              --  ["5"] = { bg = "#98971a", foreground = "#000000" },
              --  ["6"] = { bg = "#689d6a", foreground = "#000000" },
              --  ["7"] = { bg = "#458588", foreground = "#ffffff" },
              --  ["8"] = { bg = "#d3869b", foreground = "#000000" },
              --},
              global = {
                baseName = "CodeHighlight",
                style = {
                  bg = "#ff8800",
                  foreground = "#000000"
                }
              },
            },
            events = {
              osc = {
                ip = "127.0.0.1",
                port = 6013,
              },
            },
            fps = 30,
          },
        },
        sclang = {
          --- Command to launch SuperCollider
          cmd = "sclang",
          args = {},
          --- SuperCollider boot file
          file = os.getenv("HOME") .. "/.config/tidal/BootSuperDirt.scd",
          enabled = true,
        },
        split = "v",
      },
      --- Default keymaps
      --- Set to false to disable all default mappings
      --- @type table | nil
      mappings = {
        send_line = { mode = { "n" }, key = "<C-e>" },
        send_visual = { mode = { "x" }, key = "<leader><CR>" },
        send_block = { mode = { "i", "n", "x" }, key = "<M-CR>" },
        send_node = { mode = "n", key = "<leader>kk" },
        send_silence = { mode = "n", key = "<leader>d" },
        send_hush = { mode = "n", key = "<leader><Esc>" },
      },
      ---- Configure highlight applied to selections sent to tidal interpreter
      selection_highlight = {
        --- Highlight definition table
        --- see ':h nvim_set_hl' for details
        --- @type vim.api.keyset.highlight
        highlight = { link = "IncSearch" },
        --- Duration to apply the highlight for
        timeout = 150,
      },
    },
    -- Recommended: Install TreeSitter parsers for Haskell and SuperCollider
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "haskell",
          "supercollider" ,
        }
      },
    },
  }
}
