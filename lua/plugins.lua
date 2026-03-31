return {
  -- LSP Installer and Config (using mason)
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonLog" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.mason")
    end,
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
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.none-ls")
    end,
  },

  -- Magically delicious todo-lists
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = function()
      require("todo-comments").setup()
    end,
  },

  -- DiffView.nvim
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewFileHistory',
      'DiffviewFocusFiles',
      'DiffviewToggleFiles',
      'DiffviewRefresh',
    },
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
    cmd = {
      "CodeCompanion",
      "CodeCompanionActions",
      "CodeCompanionChat",
      "CodeCompanionCmd",
    },
    config = function()
      require("plugins.codecompanion")
    end
  },

  {
    'github/copilot.vim',
    event = 'InsertEnter',
    config = function()
      require("plugins.copilotvim")
    end
  },

  {
    "sudo-tee/opencode.nvim",
    cmd = {
      "Opencode",
      "OpencodeAsk",
      "OpencodeOpen",
      "OpencodeToggle",
    },
    keys = {
      { '<leader>og', desc = 'Opencode toggle' },
      { '<leader>oi', desc = 'Opencode open input' },
      { '<leader>oo', desc = 'Opencode open output' },
      { '<leader>oq', desc = 'Opencode close' },
    },
    config = function()
      require("plugins.opencode")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      'hrsh7th/nvim-cmp',
      'nvim-telescope/telescope.nvim'
    }
  },

  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    ft = { "css", "scss", "sass", "html", "javascript", "typescript", "vue", "lua", "markdown" },
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
    event = "InsertEnter",
    config = function()
      require("plugins.snippets")
    end,
  },

  -- Signature help
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function()
      require("plugins.lsp_signature")
    end,
  },

  -- Outline sidebar
  {
    "hedyhli/outline.nvim",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
      require('outline').setup({
        providers = {
          priority = { 'lsp', 'coc', 'markdown', 'norg', 'treesitter' },
        },
      })
    end,
    event = "VeryLazy",
    dependencies = {
      'epheien/outline-treesitter-provider.nvim'
    }
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
    cmd = "Telescope",
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
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("plugins.barbar")
    end,
    event = "VeryLazy",
  },

  -- Seamless Vim + Tmux navigation
  "christoomey/vim-tmux-navigator",
  "l00sed/vim-tmux-resizer",
  -- Like Tmux <C-b>z
  "caenrique/nvim-maximize-window-toggle",

  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeFindFile",
      "NvimTreeOpen",
      "NvimTreeToggle",
      "NvimTreeFocus",
    },
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
    event = { "BufReadPre", "BufNewFile" },
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
    cmd = "ZenMode",
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

  -- Smooth Scrolling
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-u>", "<C-d>", "<C-f>" },
    config = true,
  },

  -- LaTeX for Vim
  {
    "lervag/vimtex",
    ft = { "tex", "plaintex", "bib" },
    cmd = { "VimtexCompile", "VimtexView", "VimtexStop", "VimtexClean" },
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
    event = "VeryLazy",
    main = "ibl",
    opts = {},
    config = function()
      require("plugins.indent-blankline")
    end,
  },

  -- Pretty fold
  {
    "bbjornstad/pretty-fold.nvim",
    event = "BufReadPost",
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
    ft = { "tidal" },
    cmd = { "TidalLaunch", "TidalQuit" },
    init = function()
      vim.filetype.add({ extension = { tidal = "tidal" } })
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        pattern = "*.tidal",
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf, "haskell")
        end,
      })
    end,
    -- Recommended: Install TreeSitter parsers for Haskell and SuperCollider
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "haskell",
          "supercollider",
        }
      },
    },
    config = function()
      require("plugins.tidal")
    end,
  }
}
