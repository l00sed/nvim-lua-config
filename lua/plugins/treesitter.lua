-- Treesitter configuration
require('nvim-treesitter.config').setup({
	highlight = {
    enable = true,
    additional_vim_regex_highlighting = {
      "jsx",
      "php",
    },
  },
  sync_installed = true,
  -- We must manually specify which parsers to install
	ensure_installed = {
    "bash",
    "c",
    "css",
    "cpp",
    "cuda",
    "haskell",
    "html",
    "javascript",
		"json",
    "julia",
    "latex",
		"lua",
    "markdown",
    "markdown_inline",
    "nix",
    "php",
    "python",
    "query",
    "rust",
    "tsx",
    "typescript",
    "vue",
    "yaml",
	},
})

vim.treesitter.language.register('markdown', 'mdx')
vim.treesitter.language.register('markdown', 'vimwiki')
