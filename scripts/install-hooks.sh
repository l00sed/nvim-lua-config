#!/usr/bin/env bash
# install-hooks.sh: symlink repo-managed git hooks into .git/hooks/
# Run once after cloning, or re-run any time hooks change.

set -euo pipefail

REPO_ROOT="$(git -C "$(dirname "$0")" rev-parse --show-toplevel)"
HOOKS_SRC="$REPO_ROOT/scripts/hooks"
HOOKS_DST="$REPO_ROOT/.git/hooks"

if [[ ! -d "$HOOKS_SRC" ]]; then
  echo "install-hooks: scripts/hooks/ not found, nothing to do" >&2
  exit 1
fi

for hook in "$HOOKS_SRC"/*; do
  name="$(basename "$hook")"
  target="$HOOKS_DST/$name"

  if [[ -e "$target" && ! -L "$target" ]]; then
    echo "install-hooks: $name already exists and is not a symlink, skipping (back it up manually if needed)" >&2
    continue
  fi

  ln -sf "$hook" "$target"
  chmod +x "$hook"
  echo "install-hooks: installed $name"
done

echo "install-hooks: done"
