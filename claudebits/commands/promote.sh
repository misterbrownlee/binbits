#!/usr/bin/env bash
# Promote a skill that was created by /skill-creator (or by hand) under
# ~/.claude/skills/<name>/ into the claudebits repo, then symlink it back so
# the live location keeps working.
#
# Usage: promote.sh <skill-name>

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $(basename "$0") <skill-name>" >&2
  exit 1
fi

skill_name="$1"
CLAUDEBITS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$CLAUDEBITS_DIR/skills"
SOURCE="$HOME/.claude/skills/$skill_name"
DEST="$SKILLS_DIR/$skill_name"

if [ ! -e "$SOURCE" ]; then
  echo "error: $SOURCE does not exist" >&2
  exit 1
fi

if [ -L "$SOURCE" ]; then
  echo "error: $SOURCE is already a symlink — already promoted?" >&2
  exit 1
fi

if [ -e "$DEST" ]; then
  echo "error: $DEST already exists in repo — resolve manually" >&2
  exit 1
fi

mv "$SOURCE" "$DEST"
ln -s "$DEST" "$SOURCE"
echo "promoted: $skill_name"
echo "  source: $DEST"
echo "  link:   $SOURCE -> $DEST"
echo
echo "next: cd $CLAUDEBITS_DIR && git add skills/$skill_name"
