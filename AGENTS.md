# AGENTS

Guidance for coding agents (and future me) working in this repo.

## Goals

- Keep startup fast
- Preserve existing UX and keymap expectations
- Avoid broad refactors unless explicitly requested

## Core Rules

- Prefer lazy-loading plugins in `lua/plugins.lua` (`cmd`, `keys`, `event`, `ft`)
- Do not force-load heavy plugins in `init.lua`
- Keep plugin setup in `lua/plugins/<name>.lua`
- Keep `options`, `commands`, and keymaps readable and separated by concern
- Use ASCII unless file already requires Unicode

## Startup Performance Workflow

1. Capture startup profile:
   - `nvim --headless --startuptime /tmp/nvim-startup.log +qa`
2. Identify top offenders by elapsed time
3. Defer plugins/features where safe
4. Re-profile and compare

When changing startup behavior, include before/after timing notes in PR or commit message.

## Editing Conventions

- Small, focused diffs
- No unrelated formatting churn
- Comments only where logic is non-obvious
- Match existing Lua style in each file

## Validation Checklist

- `nvim --headless +qa` succeeds
- Startup profile still parses and no obvious regressions
- Common commands still work (`:Telescope`, `:NvimTreeToggle`, LSP attach, etc.)

## High-Risk Areas

- `lua/plugins/mason.lua` (can add >1s startup if eagerly loaded)
- `lua/plugins/snippets.lua` and `nvim-cmp` ecosystem
- `codecompanion` / `opencode` / AI integrations
- Tree/file explorer integrations (`barbar` + `nvim-tree` coupling)

## Preferred Change Strategy

- Start with plugin spec loading strategy changes
- Only then optimize plugin internals if needed
- Keep behavior equivalent unless user asks for behavior changes
