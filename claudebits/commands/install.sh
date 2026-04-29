#!/usr/bin/env bash
# Install custom skills from claudebits/skills/ as symlinks under ~/.claude/skills/.
# Idempotent. Safe to re-run. Will not clobber an existing real directory at the
# target — those are warned about so the user can decide whether to remove them.

set -euo pipefail

CLAUDEBITS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$CLAUDEBITS_DIR/skills"
TARGET_DIR="$HOME/.claude/skills"

mkdir -p "$TARGET_DIR"

shopt -s nullglob
for skill_path in "$SKILLS_DIR"/*/; do
  skill_name="$(basename "$skill_path")"
  source_path="${skill_path%/}"
  target="$TARGET_DIR/$skill_name"

  if [ -L "$target" ]; then
    current="$(readlink "$target")"
    if [ "$current" = "$source_path" ]; then
      echo "  ok    $skill_name (already linked)"
    else
      echo "  warn  $skill_name (symlink points elsewhere: $current) — skipping"
    fi
    continue
  fi

  if [ -e "$target" ]; then
    echo "  warn  $skill_name (real directory at $target) — remove it manually then re-run"
    continue
  fi

  ln -s "$source_path" "$target"
  echo "  link  $skill_name"
done
