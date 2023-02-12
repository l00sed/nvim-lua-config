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

-- Pattern matching a hex color, e.g. #fa74b3
local hex_color = '#' .. string.rep('[0-9a-f]', 6)

-- Invert a hex color
function M.invert_hex_color(color)
  -- Drop the initial '#'
  color = string.sub(color, 2)
  local inverted_color = '#'
  -- Fetch the different components and invert them
  for i = 0, 2 do
    -- Fetch the substring
    local component = string.sub(color, 1 + i * 2, 2 + i * 2)
    -- Convert to numerical
    component = tonumber('0x' .. component)
    -- Invert
    component = 0xff - component
    -- Append
    inverted_color = inverted_color .. string.format('%.2x', component)
  end
  return inverted_color
end

return M
