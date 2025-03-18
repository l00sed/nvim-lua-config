-- Capture shell command
function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

vim.g.copilot_node_command = os.getenv("HOME") .. '/.nvm/versions/node/' .. os.capture('node -v') .. 'bin/node'

require("copilot").setup()
