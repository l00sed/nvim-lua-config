-- Treesitter configuration
require('nvim-treesitter.configs').setup({
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
    "javascript",
		"json",
    "julia",
		"lua",
    "markdown",
    "nix",
    "php",
    "python",
    "rust",
    "tsx",
    "typescript",
    "vue",
    "yaml",
	},
})
