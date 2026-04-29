# claudebits

Personal Claude Code configuration: global instructions, custom skills (source-tracked here), and a registry of which external plugins/skills should be installed on a new machine.

## Layout

- `CLAUDE_GLOBAL.md` — global Claude Code instructions (symlinked to `~/.claude/CLAUDE.md`)
- `skills/<name>/SKILL.md` — source for skills authored by us; each subfolder is one skill
- `PLUGINS.yml` — registry of external plugins (e.g. `anthropic-skills`) to install on a new machine
- `commands/install.sh` — symlink every skill in `skills/` into `~/.claude/skills/`
- `commands/promote.sh` — move a freshly-created `~/.claude/skills/<name>/` into the repo and symlink back

Skills live at `~/.claude/skills/<name>` and are invoked with `/skill-name` in Claude Code. Custom skills in this repo are wired into that path via symlink so the normal Claude tooling keeps working unmodified.

## Setup

```bash
# 1. Symlink CLAUDE_GLOBAL.md into ~/.claude/
ln -s ~/Code/tools/binbits/claudebits/CLAUDE_GLOBAL.md ~/.claude/CLAUDE.md

# 2. Symlink each custom skill into ~/.claude/skills/
bash ~/Code/tools/binbits/claudebits/commands/install.sh

# 3. Install plugins listed in PLUGINS.yml using whatever the current install
#    command is (see PLUGINS.yml for the per-plugin command).
```

`install.sh` is idempotent and refuses to clobber an existing real directory at the target. If `~/.claude/skills/<name>/` already exists as a non-symlinked directory, remove it manually after confirming its contents match the repo copy (e.g. `diff -r`), then re-run.

## CLI Built-in Skills

Bundled with Claude Code itself — nothing to install, listed here for reference.

| Skill | Invoke | What it does |
|---|---|---|
| update-config | `/update-config` | Edits `settings.json` — hooks, permissions, env vars, automated behaviors |
| keybindings-help | `/keybindings-help` | Customizes `~/.claude/keybindings.json` (rebind keys, chord shortcuts) |
| simplify | `/simplify` | Reviews changed code for reuse, quality, and efficiency; fixes issues |
| fewer-permission-prompts | `/fewer-permission-prompts` | Scans transcripts and adds allowlist entries to reduce permission prompts |
| loop | `/loop` | Runs a prompt or command on a recurring interval (self-paced or timed) |
| schedule | `/schedule` | Creates/manages scheduled remote agents running on a cron schedule |
| claude-api | `/claude-api` | Builds, debugs, and optimizes Claude API / Anthropic SDK apps |
| init | `/init` | Initializes a `CLAUDE.md` file with codebase documentation |
| review | `/review` | Reviews the current pull request |
| security-review | `/security-review` | Security review of pending changes on the current branch |

## Plugin Skills (`anthropic-skills:*`)

Provided by the `anthropic-skills` plugin. Human-readable view; the install registry is `PLUGINS.yml`.

| Skill | Invoke | What it does |
|---|---|---|
| schedule | `/anthropic-skills:schedule` | Create a scheduled task that runs on demand or on an interval |
| consolidate-memory | `/anthropic-skills:consolidate-memory` | Reflective pass over memory files — merge duplicates, prune stale facts |
| skill-creator | `/anthropic-skills:skill-creator` | Create, edit, eval, and benchmark skills |
| pdf | `/anthropic-skills:pdf` | Read, edit, merge, split, OCR, watermark, and create PDF files |
| pptx | `/anthropic-skills:pptx` | Read, edit, and create PowerPoint decks |
| docx | `/anthropic-skills:docx` | Read, edit, and create Word documents |
| xlsx | `/anthropic-skills:xlsx` | Read, edit, and create Excel/CSV/TSV spreadsheets |
| setup-cowork | `/anthropic-skills:setup-cowork` | Guided Cowork setup — install plugin, try a skill, connect tools |

## Adding a New Custom Skill

1. Create the skill in the normal way — usually `/anthropic-skills:skill-creator`, which writes to `~/.claude/skills/<name>/`. Or scaffold by hand:

   ```bash
   mkdir -p ~/.claude/skills/my-skill
   # then create ~/.claude/skills/my-skill/SKILL.md with frontmatter + instructions
   ```

   Minimal `SKILL.md`:

   ```markdown
   ---
   name: my-skill
   description: Use this skill when the user asks to "...", mentions "...", or wants to ...
   ---

   Your instructions here.
   ```

2. Promote it into this repo so it's git-tracked:

   ```bash
   bash ~/Code/tools/binbits/claudebits/commands/promote.sh my-skill
   ```

   That moves the directory into `claudebits/skills/my-skill/` and symlinks `~/.claude/skills/my-skill` back to it. Edits to either path now go through git.

3. Commit:

   ```bash
   cd ~/Code/tools/binbits && git add claudebits/skills/my-skill && git commit
   ```

Changes take effect immediately — no Claude Code restart needed.
