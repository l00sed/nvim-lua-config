-- LSP helper function
local cmd = vim.cmd
local lspconfig_util = require('lspconfig.util')

local M = {}

-- This function defines the on_attach function for several languages which share the same key-bindings
function M.common_on_attach(client, bufnr)
  -- Set omnifunc
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- rounded borders
  vim.diagnostic.config {
    float = { border = "rounded" }
  }

  -- Helper function
  local opts = { noremap = true, silent = true }
  local function bufnnoremap(lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, rhs, opts)
  end

  -- Keymaps: we need to define keymaps for each of the LSP functionalities manually
  -- Go to definition and declaration (use leader to preserve standard use of 'gd')
  bufnnoremap("<leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  bufnnoremap("<leader>gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")

  -- Go to implementation
  bufnnoremap("<leader>gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>")

  -- List symbol uses
  -- bufnnoremap("<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")  -- Uses quickfix
  bufnnoremap("<leader>gr", "<cmd>Telescope lsp_references<CR>") -- Uses Telescope

  -- Inspect function
  bufnnoremap("K", "<Cmd>lua vim.lsp.buf.hover()<CR>")

  -- Signature help
  bufnnoremap("<leader>k", "<Cmd>lua vim.lsp.buf.signature_help()<CR>")

  -- Rename all references of symbol
  bufnnoremap("<leader>R", "<Cmd>lua vim.lsp.buf.rename()<CR>")

  -- Navigate diagnostics
  bufnnoremap("<C-n>", "<Cmd>lua vim.diagnostic.goto_next()<CR>")
  bufnnoremap("<C-p>", "<Cmd>lua vim.diagnostic.goto_prev()<CR>")

  -- Markdown preview TODO: make this conditional, but I also don't use it all that much
  -- bufnnnoremap("<leader>P", "<Cmd>Glow<CR>")

  if client.server_capabilities.document_formatting then
    cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

-- Typescript/Volar config helper
function M.on_new_config(new_config, new_root_dir)
  local function get_typescript_server_path(root_dir)
    local project_root = lspconfig_util.find_node_modules_ancestor(root_dir)
    return project_root and (lspconfig_util.path.join(project_root, 'node_modules', 'typescript', 'lib', 'tsserverlibrary.js'))
      or ''
  end

  if
    new_config.init_options
    and new_config.init_options.typescript
    and new_config.init_options.typescript.tsdk == ''
  then
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end
end

return M
