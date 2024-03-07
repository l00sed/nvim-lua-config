return {
	-- LSP Installer and Config (using mason)
	{
		"williamboman/mason.nvim", -- Helper for installing most language servers
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.null-ls")
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
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("todo-comments").setup()
		end,
	},

  -- DiffView.nvim
  {
    'sindrets/diffview.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },

	-- devicons in cmp menu
	"onsails/lspkind.nvim",

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
		},
		config = function()
			require("plugins.cmp")
		end,
	},

	-- Colorizer
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"*",
			}, {
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
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.treesitter")
		end,
	},

  -- EJS syntax
  {
    "nikvdp/ejs-syntax",
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

	"rafamadriz/friendly-snippets",

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

	-- Context
	{
		"utilyre/barbecue.nvim",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("plugins.barbecue")
		end,
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
		dependencies = "nvim-tree/nvim-web-devicons",
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
		"mhinz/vim-startify",
		config = function()
			local path = vim.fn.stdpath("config") .. "/lua/plugins/startify.lua"
			vim.cmd("source " .. path)
		end,
	},

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

	-- -- tpope
	"tpope/vim-commentary",
	"tpope/vim-unimpaired",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	-- -- easy-align
	"junegunn/vim-easy-align",
	-- -- React / JS
	"maksimr/vim-jsbeautify",
	"othree/javascript-libraries-syntax.vim",
	"pangloss/vim-javascript",
	"leafgarland/typescript-vim",
	"mxw/vim-jsx",
	"peitalin/vim-jsx-typescript",
	"othree/yajs.vim",
	-- -- Django
	"tweekmonster/django-plus.vim",
	-- -- Python formatting
	"EgZvor/vim-black",
	"jeetsukumaran/vim-python-indent-black",
	-- -- PHP
	"2072/PHP-Indenting-for-VIm",
	-- -- CSS
	"hail2u/vim-css3-syntax",
	-- -- Markdown
	"tpope/vim-markdown",
	-- -- Prettier formatting
	-- -- Requires null-ls
	{
		"MunifTanjim/prettier.nvim",
		config = function()
			require("prettier").setup({
				bin = "prettier",
				filetypes = {
					"css",
					"djangohtml",
					"graphql",
					"html",
					"javascript",
					"javascriptreact",
					"json",
					"less",
					"markdown",
					"md",
					"scss",
					"solidity",
					"toml",
					"txt",
					"typescript",
					"typescriptreact",
					"vue",
					"yaml",
				},
				["null-ls"] = {
					condition = function()
						return prettier.config_exists({
							-- if false, skips checking package.json for "prettier" key
							check_package_json = true,
						})
					end,
					runtime_condition = function(params)
						-- return false to skip running prettier
						return true
					end,
					timeout_ms = 10000,
				},
			})
		end,
	},
	-- Python
	-- use 'heavenshell/vim-pydocstring'   -- Overwrites a keymap, need to fix.
	-- use 'bfredl/nvim-ipy'

	-- TOML Files
	"cespare/vim-toml",

	-- Markdown ToC
	"mzlogin/vim-markdown-toc",

	-- Poetry
	-- {
	--   'petobens/poet-v',
	--   config = function()
	--     local path = vim.fn.stdpath('config')..'/lua/plugins/poet-v.vim'
	--     vim.cmd('source '..path)
	--   end
	-- })

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

	-- Documentation Generator (jsDoc, etc.)
	{
		"kkoomen/vim-doge",
		build = ":call doge#install()",
	},

	-- Smooth Scrolling
	{
		"karb94/neoscroll.nvim",
		config = true,
	},

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
		"anuvyklack/pretty-fold.nvim",
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
}
