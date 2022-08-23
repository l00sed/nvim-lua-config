-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
  -- To disable, uncomment the line below
  --virtual_lines=false
  virtual_lines = {
    only_current_line = true
  }
})

