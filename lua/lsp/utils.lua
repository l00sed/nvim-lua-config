-- LSP helper function

local cmd = vim.cmd

local M = {}

-- This function defines the on_attach function for several languages which share the same key-bindings
function M.common_on_attach(client, bufnr)
  -- Set omnifunc
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- LSP settings (for overriding per client)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
      border = "rounded"
    }
  )
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
      border = "rounded"
    }
  )

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

return M
