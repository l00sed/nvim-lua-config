-- Enable language servers with common settings
local servers = {
  "intelephense",
  "eslint",
  "tsserver",
  "cssls",
  "html",
  "bashls",
  "clangd",
  "pyright",
  "jsonls",
  "dockerls"
}

require('mason').setup({
  ui = {
    -- Whether to automatically check for outdated servers when opening the UI window.
    check_outdated_servers_on_open = true,
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "none",
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})
require('mason-lspconfig').setup({
  -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  automatic_installation = true,
  ensure_installed = servers,
})

local nvim_lsp = require('lspconfig')
local utils = require('lsp.utils')
local common_on_attach = utils.common_on_attach
local settings = {}
local configs = {}

-- add capabilities from nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  if (lsp == "intelephense") then
    if not configs.intelephense then
      configs.intelephense = {
        default_config = {
          cmd = { 'intelphense', '--stdio' },
          filetypes = { 'php' },
          root_dir = function()
            return vim.loop.cwd()
          end
        }
      }
    end
    settings = {
      intelephense = {
        stubs = {
          "bcmath",
          "bz2",
          "calendar",
          "Core",
          "curl",
          "date",
          "dba",
          "dom",
          "enchant",
          "fileinfo",
          "filter",
          "ftp",
          "gd",
          "gettext",
          "hash",
          "iconv",
          "imap",
          "intl",
          "json",
          "ldap",
          "libxml",
          "mbstring",
          "mcrypt",
          "mysql",
          "mysqli",
          "password",
          "pcntl",
          "pcre",
          "PDO",
          "pdo_mysql",
          "Phar",
          "readline",
          "recode",
          "Reflection",
          "regex",
          "session",
          "SimpleXML",
          "soap",
          "sockets",
          "sodium",
          "SPL",
          "standard",
          "superglobals",
          "sysvsem",
          "sysvshm",
          "tokenizer",
          "xml",
          "xdebug",
          "xmlreader",
          "xmlwriter",
          "yaml",
          "zip",
          "zlib",
          "wordpress",
          "woocommerce",
          "acf-pro",
          "wordpress-globals",
          "wp-cli",
          "genesis",
          "polylang"
        },
        diagnostics = {
          enable = true,
        },
        environment = {
          -- this line forces the composer path for the stubs in case intelephense doesn't find it
          includePaths = {
            '/home/dan/.config/composer/vendor/php-stubs/'
          }
        },
        files = {
          maxSize = 5000000
        }
      }
    }
  end
  nvim_lsp[lsp].setup({
    on_attach = common_on_attach,
    capabilities = capabilities,
    settings = settings,
    configs = configs,
  })
end

-- signature help hover
require "lsp_signature".setup({})