-- Treesitter configuration
require('nvim-treesitter').install({
  "bash",
  "c",
  "css",
  "cpp",
  "cuda",
  "haskell",
  "html",
  "javascript",
  "json",
  "jsx",
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
})

vim.treesitter.language.register('javascript', { 'jsx' })
vim.treesitter.language.register('markdown', 'mdx')
vim.treesitter.language.register('markdown', 'vimwiki')
vim.treesitter.language.register('haskell', 'tidal')
