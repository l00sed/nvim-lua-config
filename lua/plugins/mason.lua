-- Enable language servers with common settings
-- For available values, look here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- Or run:
-- :help lspconfig-all
local servers = {
  "bashls",
  "biome",
  "cssls",
  "css_variables",
  "cssmodules_ls",
  "docker_compose_language_service",
  "dockerls",
  "eslint",
  "html",
  "intelephense",
  "jsonls",
  "lua_ls",
  --"pyright",
  "pylsp",
  "rnix",
  "stylelint_lsp",
  "tailwindcss",
  "vtsls",
  "vue_ls",
}

local ensure_installed_list = {}

-- Capture shell command
function CmdCapture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

-- Don't use Mason's auto-installer,
-- but still configure these servers.
local excludes = {
--  "pyright",
  "eslint"
}
for _, server in ipairs(servers) do
  for _, exclude in ipairs(excludes) do
    if not string.match(server, exclude) then
      table.insert(ensure_installed_list, server)
    end
  end
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
  -- Automatically detect which servers to install
  -- (based on which servers are set up via lspconfig)
  automatic_installation = false,
  ensure_installed = ensure_installed_list
})

local lspconfig_util = require('lspconfig.util')
local lsp_utils = require('lsp.utils')

-- Setup border
require('lspconfig.ui.windows').default_options.border = 'rounded'

-- add capabilities from nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local raw_nvm = tostring(CmdCapture('export NVM_DIR="$HOME/.nvm"; source $NVM_DIR/nvm.sh && nvm alias default')) or ''
local v, node_version
if raw_nvm ~= '' and raw_nvm ~= nil then
  v = string.find(raw_nvm, 'v')
  if v ~= '' and v ~= nil then
    node_version = string.sub(raw_nvm, v, -2)
  end
else
  vim.notify('NVM is not installed or not configured properly.', vim.log.levels.ERROR)
  return
end

local nvm_path = os.getenv("HOME") .. '/.nvm/versions/node/' .. node_version

local default_config = {}
local configs = {}
local settings = {}
local filetypes = {}
local on_init = function () end
local on_attach = lsp_utils.common_on_attach

for _, lsp in ipairs(servers) do
  -- ESLint (Javascript and Typescript)
  if (lsp == "eslint") then
    local root_file = {
      '.eslintrc',
      '.eslintrc.js',
      '.eslintrc.cjs',
      '.eslintrc.yaml',
      '.eslintrc.yml',
      '.eslintrc.json',
      'eslint.config.js',
      'eslint.config.mjs',
      'eslint.config.cjs',
      'eslint.config.ts',
      'eslint.config.mts',
      'eslint.config.cts',
    }

    default_config = {
      cmd = { 'vscode-eslint-language-server', '--stdio' },
      filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
        'vue',
        'svelte',
        'astro',
      },
      -- https://eslint.org/docs/user-guide/configuring/configuration-files#configuration-file-formats
      root_dir = lspconfig_util.root_pattern(root_file),
      -- Refer to https://github.com/Microsoft/vscode-eslint#settings-options for documentation.
      settings = {
        validate = 'on',
        packageManager = nil,
        useESLintClass = false,
        experimental = {
          useFlatConfig = false,
        },
        codeActionOnSave = {
          enable = false,
          mode = 'all',
        },
        format = true,
        quiet = false,
        onIgnoredFiles = 'off',
        rulesCustomizations = {},
        run = 'onType',
        problems = {
          shortenToSingleLine = false,
        },
        -- nodePath configures the directory in which the eslint server should start its node_modules resolution.
        -- This path is relative to the workspace folder (root dir) of the server instance.
        nodePath = '',
        -- use the workspace folder location or the file location (if no workspace folder is open) as the working directory
        workingDirectory = { mode = 'location' },
        codeAction = {
          disableRuleComment = {
            enable = true,
            location = 'separateLine',
          },
          showDocumentation = {
            enable = true,
          },
        },
      },
      on_new_config = function(config, new_root_dir)
        -- The "workspaceFolder" is a VSCode concept. It limits how far the
        -- server will traverse the file system when locating the ESLint config
        -- file (e.g., .eslintrc).
        config.settings.workspaceFolder = {
          uri = new_root_dir,
          name = vim.fn.fnamemodify(new_root_dir, ':t'),
        }

        -- Support flat config
        if
          vim.fn.filereadable(new_root_dir .. '/eslint.config.js') == 1
          or vim.fn.filereadable(new_root_dir .. '/eslint.config.mjs') == 1
          or vim.fn.filereadable(new_root_dir .. '/eslint.config.cjs') == 1
          or vim.fn.filereadable(new_root_dir .. '/eslint.config.ts') == 1
          or vim.fn.filereadable(new_root_dir .. '/eslint.config.mts') == 1
          or vim.fn.filereadable(new_root_dir .. '/eslint.config.cts') == 1
        then
          config.settings.experimental.useFlatConfig = true
        end

        -- Support Yarn2 (PnP) projects
        local pnp_cjs = lspconfig_util.path.join(new_root_dir, '.pnp.cjs')
        local pnp_js = lspconfig_util.path.join(new_root_dir, '.pnp.js')
        if lspconfig_util.path.exists(pnp_cjs) or lspconfig_util.path.exists(pnp_js) then
          config.cmd = vim.list_extend({ 'yarn', 'exec' }, config.cmd)
        end
      end,
      handlers = {
        ['eslint/openDoc'] = function(_, result)
          if not result then
            return
          end
          local sysname = vim.loop.os_uname().sysname
          if sysname:match 'Windows' then
            os.execute(string.format('start %q', result.url))
          elseif sysname:match 'Linux' then
            os.execute(string.format('xdg-open %q', result.url))
          else
            os.execute(string.format('open %q', result.url))
          end
          return {}
        end,
        ['eslint/confirmESLintExecution'] = function(_, result)
          if not result then
            return
          end
          return 4 -- approved
        end,
        ['eslint/probeFailed'] = function()
          vim.notify('[lspconfig] ESLint probe failed.', vim.log.levels.WARN)
          return {}
        end,
        ['eslint/noLibrary'] = function()
          vim.notify('[lspconfig] Unable to find ESLint library.', vim.log.levels.WARN)
          return {}
        end,
      },
    }
  end

  -- Lua Language Server
  if (lsp == "lua_ls") then
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

  -- PHP Language Server
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

  -- CSS Language Server
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

  -- Python Language Server
  -- Uses the flake8 plugin for linting
  if (lsp == "pylsp") then
    settings = {
      pylsp = {
        plugins = {
          flake8 = {
            enabled = true
          }
        }
      }
    }
  end

  -- Tailwind Language Server
  if (lsp == "tailwindcss") then
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            "Class \\=([^,]*),", "'([^']*)'",
            "Class \\=([^,]*),", "\"([^\"]*)\"",
            "Class \\=([^,]*),", "\\`([^\\`]*)\\`"
          }
        }
      }
    }
    filetypes = {
      "aspnetcorerazor",
      "astro",
      "astro-markdown",
      "blade",
      "clojure",
      "django-html",
      "htmldjango",
      "edge",
      "eelixir",
      "elixir",
      "ejs",
      "erb",
      "eruby",
      "gohtml",
      "gohtmltmpl",
      "haml",
      "handlebars",
      "hbs",
      "html",
      "htmlangular",
      "html-eex",
      "heex",
      "jade",
      "leaf",
      "liquid",
      "markdown",
      "mdx",
      "mustache",
      "njk",
      "nunjucks",
      "php",
      "razor",
      "slim",
      "twig",
      "css",
      "less",
      "postcss",
      "sass",
      "scss",
      "stylus",
      "sugarss",
      "javascript",
      "javascriptreact",
      "reason",
      "rescript",
      "typescript",
      "typescriptreact",
      "vue",
      "svelte",
      "templ"
    }
  end

  -- Typescript Language Server
  -- Install with Node:
  --   npm i -g @vtsls/language-server
  --   npm i -g typescript
  if (lsp == "vtsls") then
    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = {
            {
              name = '@vue/typescript-plugin',
              location = nvm_path .. '/lib/node_modules/@vue/language-server',
              languages = { 'vue' },
              configNamespace = 'typescript'
            }
          }
        }
      }
    }
    filetypes = {
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue"
    }
    on_attach = function(client, bufnr)
      client.server_capabilities.semanticTokensProvider = nil
    end
  end

  -- Vue Language Server
  -- Install with Node:
  --  npm i -g @vue/language-server
  -- requires the vtsls config above
  if (lsp == "vue_ls") then
    settings = {
      typescript = {
        inlayHints = {
          enumMemberValues = {
            enabled = true,
          },
          functionLikeReturnTypes = {
            enabled = true,
          },
          propertyDeclarationTypes = {
            enabled = true,
          },
          parameterTypes = {
            enabled = true,
            suppressWhenArgumentMatchesName = true,
          },
          variableTypes = {
            enabled = true,
          },
        },
      },
    }
  end

  if (default_config ~= nil or settings ~= nil) then
    vim.lsp.config(lsp, {
      default_config = default_config,
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
      settings = settings,
      filetypes = filetypes,
      configs = configs
    })
  else
    vim.lsp.config(lsp)
  end
end
