local json = require('lunajson')
local config = ".codecompanion.json"

-- Check if file exists
function exists(name)
  local f=io.open(name,"r")
  if f~=nil then io.close(f) return true else return false end
end

-- Join paths
function join(...)
  return table.concat({ ... }, '/')
end

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

local cwdGitRoot = os.capture('git rev-parse --show-toplevel')
config = join(cwdGitRoot, config)
local configExists = exists(config)

-- --------------------------------------------
-- Set the adapter
-- --------------------------------------------
-- To start Ollama server (and start at startup)...
-- -- macOS: brew services start ollama
local adapter_options = { "ollama", "copilot", "opal" }
-- Change this index to set the default adapter
vim.env.ADAPTER = adapter_options[2]

-- --------------------------------------------
-- Setup the default model for each adapter
-- --------------------------------------------
local model_options = {
  ollama = "gemma3:12b",                             -- Ollama
  copilot = "claude-sonnet-4.5",                     -- Copilot
  opal = "Qwen/Qwen2.5-Coder-7B-Instruct-GPTQ-Int4"  -- Opal
}
vim.env.MODEL = model_options[vim.env.ADAPTER]

local content = {}
if configExists == true then
  local file = io.open(config, "r")
  if io.type(file) == "file" then
    local read = file:read("*a")
    file:close()
    content = json.decode(read)
  end

  local function has_value(tab, val)
    for index, value in ipairs(tab) do
      if string.lower(value) == string.lower(val) then
        return true
      end
    end
    return false
  end

  local django = has_value(content.keyKnowledge, "django")
  local js = has_value(content.keyKnowledge, "javascript")
  local next = has_value(content.keyKnowledge, "next")
  local nuxt = has_value(content.keyKnowledge, "nuxt")
  local python = has_value(content.keyKnowledge, "python")
  local react = has_value(content.keyKnowledge, "react")
  local tailwind = has_value(content.keyKnowledge, "tailwind")
  local ts = has_value(content.keyKnowledge, "typescript")
  local vite = has_value(content.keyKnowledge, "vite")
  local vitest = has_value(content.keyKnowledge, "vitest")
  local vue = has_value(content.keyKnowledge, "vue")

  --adapter = content.adapter
  keyKnowledge = table.concat(content.keyKnowledge, ", ")
  languages = " " .. table.concat(content.languages, ", ") .. " "

  -- Refer to https://cursor.directory for more prompts

  local codeStyle = "\
  Code Style and Structure\
  \
  - Write clean, maintainable, and technically accurate" .. languages .. "code.\
  - Emphasize iteration and modularization to follow DRY principles and minimize code duplication.\
  "

  if ts == true or npm == true then
    codeStyle = codeStyle .. "\
  - Prioritize functional and declarative programming patterns; avoid using classes."
  end

  if vue == true then
    codeStyle = codeStyle .. "\
  - Prefer Composition API <script setup> style."
  end

  if django == true or python == true then
    codeStyle = codeStyle .."\
  Django/Python\
  - Write clear, technical responses with precise Django examples.\
  - Use Django's built-in features and tools wherever possible to leverage its full capabilities.\
  - Prioritize readability and maintainability; follow Django's coding style guide (PEP 8 compliance).\
  - Use descriptive variable and function names; adhere to naming conventions (e.g., lowercase with underscores for functions and variables).\
  - Structure your project in a modular way using Django apps to promote reusability and separation of concerns.\
  - Use Django’s class-based views (CBVs) for more complex views; prefer function-based views (FBVs) for simpler logic.\
  - Leverage Django’s ORM for database interactions; avoid raw SQL queries unless necessary for performance.\
  - Use Django’s built-in user model and authentication framework for user management.\
  - Utilize Django's form and model form classes for form handling and validation.\
  - Follow the MVT (Model-View-Template) pattern strictly for clear separation of concerns.\
  - Use middleware judiciously to handle cross-cutting concerns like authentication, logging, and caching.\
  \
  Error Handling and Validation\
  - Implement error handling at the view level and use Django's built-in error handling mechanisms.\
  - Use Django's validation framework to validate form and model data.\
  - Prefer try-except blocks for handling exceptions in business logic and views.\
  - Customize error pages (e.g., 404, 500) to improve user experience and provide helpful information.\
  - Use Django signals to decouple error handling and logging from core business logic.\
  \
  Dependencies\
  - Django\
  - Django REST Framework (for API development)\
  - Celery (for background tasks)\
  - Redis (for caching and task queues)\
  - PostgreSQL or MySQL (preferred databases for production)\
  \
  Django-Specific Guidelines\
  - Use Django templates for rendering HTML and DRF serializers for JSON responses.\
  - Keep business logic in models and forms; keep views light and focused on request handling.\
  - Use Django's URL dispatcher (urls.py) to define clear and RESTful URL patterns.\
  - Apply Django's security best practices (e.g., CSRF protection, SQL injection protection, XSS prevention).\
  - Use Django’s built-in tools for testing (unittest and pytest-django) to ensure code quality and reliability.\
  - Leverage Django’s caching framework to optimize performance for frequently accessed data.\
  - Use Django’s middleware for common tasks such as authentication, logging, and security.\
  \
  Django Performance Optimization\
  - Optimize query performance using Django ORM's select_related and prefetch_related for related object fetching.\
  - Use Django’s cache framework with backend support (e.g., Redis or Memcached) to reduce database load.\
  - Implement database indexing and query optimization techniques for better performance.\
  - Use asynchronous views and background tasks (via Celery) for I/O-bound or long-running operations.\
  - Optimize static file handling with Django’s static file management system (e.g., WhiteNoise or CDN integration).\
  \
  Key Conventions\
  1. Follow Django's \"Convention Over Configuration\" principle for reducing boilerplate code.\
  2. Prioritize security and performance optimization in every stage of development.\
  3. Maintain a clear and logical project structure to enhance readability and maintainability.\
  \
  Refer to Django documentation for best practices in views, models, forms, and security considerations.\
  "
  end

  if nuxt == true then
    codeStyle = codeStyle .. "\
  - Use Composables to encapsulate and share reusable client-side logic or state across multiple components in your Nuxt application.\
  \
  Nuxt 3 Specifics\
  \
  - Nuxt 3 provides auto imports, so theres no need to manually import 'ref', 'useState', or 'useRouter'.\
  - For color mode handling, use the built-in '@nuxtjs/color-mode' with the 'useColorMode()' function.\
  - Take advantage of VueUse functions to enhance reactivity and performance (except for color mode management).\
  - Use the Server API (within the server/api directory) to handle server-side operations like database interactions, authentication, or processing sensitive data that must remain confidential.\
  - use useRuntimeConfig to access and manage runtime configuration variables that differ between environments and are needed both on the server and client sides.\
  - For SEO use useHead and useSeoMeta.\
  - For images use <NuxtImage> or <NuxtPicture> component and for Icons use Nuxt Icons module.\
  - use app.config.ts for app theme configuration.\
  \
  Fetching Data\
  \
  1. Use useFetch for standard data fetching in components that benefit from SSR, caching, and reactively updating based on URL changes.\
  2. Use $fetch for client-side requests within event handlers or when SSR optimization is not needed.\
  3. Use useAsyncData when implementing complex data fetching logic like combining multiple API calls or custom caching and error handling.\
  4. Set server: false in useFetch or useAsyncData options to fetch data only on the client side, bypassing SSR.\
  5. Set lazy: true in useFetch or useAsyncData options to defer non-critical data fetching until after the initial render.\
  \
  Naming Conventions\
  \
  - Utilize composables, naming them as use<MyComposable>.\
  - Use **PascalCase** for component file names (e.g., components/MyComponent.vue).\
  - Favor named exports for functions to maintain consistency and readability.\
  "
  end

  if react == true then
    codeStyle = codeStyle .. '\
  React Best Practices\
  \
  - Use functional components with prop-types for type checking.\
  - Keep components small and focused on a single responsibility\
  - Use the "function" keyword for component definitions.\
  - Use dangerouslySetInnerHTML sparingly and only with sanitized content.\
  - Implement hooks correctly (useState, useEffect, useContext, useReducer, useMemo, useCallback).\
  - Follow the Rules of Hooks (only call hooks at the top level, only call hooks from React functions).\
  - Create custom hooks to extract reusable component logic.\
  - Use `React.memo()` for component memoization when appropriate.\
  - Implement useCallback for memoizing functions passed as props.\
  - Use `useMemo` for expensive computations.\
  - Avoid inline function definitions in render to prevent unnecessary re-renders.\
  - Prefer composition over inheritance.\
  - Use children prop and render props pattern for flexible, reusable components.\
  - Use refs sparingly and mainly for DOM access.\
  - Prefer controlled components over uncontrolled components.\
  - Implement error boundaries to catch and handle errors gracefully.\
  - Use cleanup functions in useEffect to prevent memory leaks.\
  - Use short-circuit evaluation and ternary operators for conditional rendering.\
  '
  end

  if next == true then
    codeStyle = codeStyle .. "\
  Next.js Guidelines\
  \
  - Prioritize using React Server Components and Next.js server-side rendering (SSR) features where possible.\
  - Minimize the usage of client components ('use client') to small, isolated components.\
  - Always add loading and error states to data fetching components\
  - Implement error handling and error logging\
  - Use semantic HTML elements where possible\
  - Limit use of `use client`:\
    - Favor server components and Next.js server-side rendering (SSR).\
    - Use only for Web API access in small components.\
    - Avoid for data fetching or state management.\
  \
  Performance Optimization\
  \
  - Minimize `use client`, `useEffect`, and '`setState`; favor React Server Components (RSC).\
  - Wrap client components in Suspense with fallback.\
  - Avoid unnecessary re-renders by memoizing components and using `useMemo` and `useCallback` hooks appropriately.\
  - Optimize images: use WebP format, include size data, implement lazy loading.\
  - Implement route-based code splitting in Next.js.\
  - Use dynamic loading for non-critical components.\
  - Minimize the use of global styles; prefer modular, scoped styles.\
  "
  end

  if ts == true then
    codeStyle = codeStyle .. "\
  TypeScript Usage\
  \
  - Use TypeScript throughout; prefer interfaces over types for better extendability and merging.\
  - Avoid enums, opting for maps for improved type safety and flexibility.\
  - Use functional components with TypeScript interfaces and types for props.\
  - Avoid using `any` or `unknown` unless absolutely necessary. Look for type definitions in the codebase instead.\
  - Use strict mode in TypeScript for better type safety.\
  - Use the `function` keyword for pure functions.\
  - Avoid type assertions with `as` or `!`.\
  - Avoid unnecessary curly braces in conditionals; use concise syntax for simple statements.\
  "
  end

  if tailwind == true then
    codeStyle = codeStyle .. "\
  UI and Styling\
  \
  - Use " .. (nuxt and "Nuxt UI and ") .. "Tailwind CSS for components and styling.\
  - Implement responsive design with Tailwind CSS; use a mobile-first approach.\
  - Ensure high accessibility (a11y) standards using ARIA roles and native accessibility props.\
  - Ensure keyboard navigation support.\
  - Use utility classes where necessary.\
  - Use semantic HTML elements where possible.\
  "
  end

  codeStyle = codeStyle .. "\
  Security\
  - Sanitize user inputs to prevent XSS attacks.\
  - Use built-in security features, such as Content Security Policy (CSP), to protect against common web vulnerabilities.\
  - Ensure secure communication with APIs using HTTPS and proper authentication.\
  - Ensure no sensitive data (API keys, tokens, user data) is exposed through client components.\
  \
  Key Conventions\
  - Optimize Web Vitals (LCP, CLS, FID).\
  "

  local knowledge = "\
  You have extensive knowledge in " .. keyKnowledge .. ". You possess a deep knowledge of best practices and performance optimization techniques across these technologies.\
  " .. codeStyle

  codeStyle = knowledge
else
  print("NOTE: No codecompanion.json found for the current project directory.")
end

require("codecompanion").setup({
  display = {
    provider = "delta" -- Use 'delta' for a more compact diff view
  },
  adapters = {
    -- Currently not investigating the ACP adapters
    http = {
      copilot = function()
        -- configure copilot adapter
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = vim.env.MODEL
            }
          }
        })
      end,
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          schema = {
            model = {
              default = model
            },
            num_ctx = {
              default = 16384
            },
            num_predict = {
              default = -1
            }
          }
        })
      end,
      opal = function()
        -- configure opal adapter
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = os.getenv("OPAL_API_URL"),
            api_key = os.getenv("OPAL_API_KEY")
          },
          schema = {
            model = {
              default = vim.env.MODEL
            }
          }
        })
      end
    }
  },
  interactions = {
    chat = {
      adapter = vim.env.ADAPTER,
      model = vim.env.MODEL
    },
    inline = {
      adapter = vim.env.ADAPTER,
      model = vim.env.MODEL
    },
    cmd = {
      adapter = vim.env.ADAPTER,
      model = vim.env.MODEL
    },
    background = {
      adapter = vim.env.ADAPTER,
      model = vim.env.MODEL
    },
  },
  opts = {
    ---@param adapter CodeCompanion.Adapter
    ---@return string
    system_prompt = function(opts)
      return codeStyle
    end
  }
})
