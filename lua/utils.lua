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

-- Open floating diagnostics
function M.open_float()
  vim.diagnostics.open_float(0, { scope = "line" })
end

-- Check if value exists in array
function M.in_table(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end

return M
