-- Enable language servers with common settings
-- For available values, look here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "bashls",
  --"clangd",
  "cssls",
  "cssmodules_ls",
  "dockerls",
  "eslint",
  "grammarly",
  "html",
  "intelephense",
  "jsonls",
  --"ltex",
  "pyright",
  "rome",
  "stylelint_lsp",
  --"sumneko_lua",
  "tailwindcss",
  --"texlab",
  "tsserver",
  "volar",
  "vuels",
}

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

require('mason').setup({
  log_level = vim.log.levels.DEBUG,
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

local lspconfig = require('lspconfig')
local lspconfig_util = require('lspconfig.util')
local utils = require('lsp.utils')

-- Setup border
require('lspconfig.ui.windows').default_options.border = 'rounded'

local common_on_attach = utils.common_on_attach
local settings = {}
local configs = {}
local init_options = {}
local default_config = {}

-- add capabilities from nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  if (lsp == 'sumneko_lua') then
    settings = {
      Lua = {
        diagnostics = {
          -- Get the LS to recognize the vim global
          globals = { 'vim' }
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.stdpath('config') .. '/lua'] = true,
          },
        }
      }
    }
  end

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
          "cypress", -- JavaScript e2e testing library
          "date",
          "dba",
          "django",
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
          "tailwindcss",
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
            os.getenv("HOME").."/.config/composer/vendor/php-stubs/"
          }
        },
        files = {
          maxSize = 5000000
        }
      }
    }
  end

  if (lsp == "cssls") then
    settings = {
      css = {
        lint = {
          unknownAtRules = "ignore"
        }
      },
      scss = {
        lint = {
          unknownAtRules = "ignore"
        }
      }
    }
  end

  -- Pyright
  if (lsp == "pyright") then
    settings = {
      python = {
        pythonPath = os.capture('which python3'),
        analysis = {
          typeCheckingMode = "basic", -- off, basic, strict
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          autoImportCompletions = true,
          diagnosticMode = "workspace"
        }
      }
    }
  end

  -- Typescript
  if (lsp == "tsserver") then
    default_config = {
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue"
      }
    }
  end

  -- Typescript must be installed
  if (lsp == "volar") then
    local volar_cmd = { 'vue-language-server', '--stdio' }
    local volar_root_dir = lspconfig_util.root_pattern('package.json')

    default_config = {
      cmd = volar_cmd,
      root_dir = volar_root_dir,
      on_new_config = utils.on_new_config,
      init_options = {
        typescript = {
          -- Requires npm to be installed through NVM
          tsdk = os.getenv("HOME") .. '/.nvm/versions/node/' .. os.capture('node -v') .. '/lib/node_modules/typescript/lib'
        },
        languageFeatures = {
          implementation = true, -- new in @volar/vue-language-server v0.33
          references = true,
          definition = true,
          typeDefinition = true,
          callHierarchy = true,
          hover = true,
          rename = true,
          renameFileRefactoring = true,
          signatureHelp = true,
          codeAction = true,
          workspaceSymbol = true,
          completion = {
            defaultTagNameCase = 'both',
            defaultAttrNameCase = 'kebabCase',
            getDocumentNameCasesRequest = false,
            getDocumentSelectionRequest = false,
          }
        }
      }
    }
  end

  lspconfig[lsp].setup({
    default_config = default_config,
    on_attach = common_on_attach,
    capabilities = capabilities,
    settings = settings,
    configs = configs,
  })
end
