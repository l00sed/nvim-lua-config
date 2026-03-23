-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_lines = {
    only_current_line = true
  },
  virtual_text = {
    source = true,
    current_line = true,
    format = function(diagnostic)
      if diagnostic.user_data and diagnostic.user_data.code then
        return string.format('%s %s', diagnostic.user_data.code, diagnostic.message)
      else
        return diagnostic.message
      end
    end,
  },
  signs = true,
  float = {
    header = 'Diagnostics',
    source = true,
    border = 'rounded',
  },
})
