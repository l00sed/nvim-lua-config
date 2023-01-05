-- Utilities
local M = {}

-- Toggle Wrap
function M.toggle_wrap()
  if vim.o.wrap then
    vim.o.wrap = false
    vim.o.virtualedit = 'all'
  else
    vim.o.wrap = true
    vim.o.virtualedit = ''
    vim.o.display = 'lastline'
  end
end

return M
