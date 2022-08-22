local nvim_lsp = require('lspconfig')
local utils = require('lsp.utils')
local common_on_attach = utils.common_on_attach

-- add capabilities from nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable language servers with common settings
local servers = {"intelephense", "phpactor", "cssls", "html", "bashls", "clangd", "pyright", "jsonls", "dockerls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = common_on_attach,
    capabilities = capabilities,
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
        environment = {
          -- this line forces the composer path for the stubs in case intelephense doesn't find it
          includePaths = '/home/dan/.config/composer/vendor/php-stubs/'
        },
        files = {
          maxSize = 5000000
        }
      }
    }
  })
end

require('lsp.sumneko')

-- signature help hover
require "lsp_signature".setup({ })

