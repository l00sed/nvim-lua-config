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

-- Add files that have been marked in NvimTree to the argdo argument list
function M.add_marked_to_args()
  -- Get marked files from NvimTree
  local marked_paths = require("nvim-tree.api").marks.list()
  -- Empty list to store verified files (not hidden, not directory)
  local verified_files = {}
  for i, marked_path in ipairs(marked_paths) do
    -- Checks
    local type = false
    local path = false
    local hidden = false
    -- Store abs_paths
    local abs_path = ''
    for j, v in pairs(marked_path) do
      if tostring(j) == "type" and tostring(v) == "file" then
        type = true
      end
      if tostring(j) == "absolute_path" then
        if M.file_exists(tostring(v)) then
          path = true
          abs_path = tostring(v)
        end
      end
      if tostring(j) == "hidden" and v == false then
        hidden = true
      end
    end
    -- print('type: '..tostring(type)..', path: '..tostring(path)..', hidden: '..tostring(hidden))
    -- If checks all passed, the insert the file path
    if type and path and hidden then
      table.insert(verified_files, abs_path)
    end
  end
  -- Add args to local arg list
  for i, vp in ipairs(verified_files) do
    vim.cmd("silent argadd " .. tostring(vp))
  end
  -- Remove buffers, show arglist and then re-open NvimTree
  vim.cmd("silent set hidden | silent %bd | silent NvimTreeOpen")
end

-- Check that file exists
function M.file_exists(name)
  local exists = io.open(tostring(name), "r")
  if exists ~= nil then io.close(exists) return true else return false end
end

return M
