# claudebits

Personal Claude Code configuration: global instructions and a git-tracked home for custom skills.

## Layout

- `CLAUDE_GLOBAL.md` — global Claude Code instructions (symlinked to `~/.claude/CLAUDE.md`)
- `skills/<name>/SKILL.md` — custom skills tracked in git; each subfolder is one skill
- `commands/install.sh` — symlink every skill in `skills/` into `~/.claude/skills/`
- `commands/promote.sh` — move a freshly-created `~/.claude/skills/<name>/` into the repo and symlink back

Skills live at `~/.claude/skills/<name>` and are invoked with `/skill-name` in Claude Code. Custom skills in this repo are wired into that path via symlink so the normal Claude tooling keeps working unmodified.

## New Machine Setup

```bash
# 1. Wire global instructions
ln -s ~/Code/tools/binbits/claudebits/CLAUDE_GLOBAL.md ~/.claude/CLAUDE.md

# 2. Install custom skills (symlinks into ~/.claude/skills/)
bash ~/Code/tools/binbits/claudebits/commands/install.sh

# 3. Install plugins
claude /plugin marketplace add https://github.com/EveryInc/every-marketplace
claude /plugin install compound-engineering
# anthropic-skills: confirm exact install command and add here
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

Provided by the `anthropic-skills` plugin.

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

## Plugin Skills (`compound-engineering`)

Provided by the `compound-engineering` plugin (Every.to). Implements the Plan→Work→Review→Compound loop. Guide: <https://every.to/guides/compound-engineering>

| Command | What it does |
|---|---|
| `/workflows:brainstorm` | Clarify fuzzy requirements via guided questioning |
| `/workflows:plan` | Spawn parallel research agents → structured implementation plan |
| `/workflows:work` | Execute plan in isolation (Git worktree), run quality checks |
| `/workflows:review` | 14+ parallel specialized reviewers (security, perf, arch, data…) |
| `/workflows:compound` | Capture patterns into CLAUDE.md + searchable docs/solutions/ |
| `/lfg` | End-to-end: plan → work → review → resolve → PR (50+ agents) |

## Adding a New Custom Skill

1. Create the skill — usually `/anthropic-skills:skill-creator`, which writes to `~/.claude/skills/<name>/`. Or scaffold by hand:

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

## Adding a Skill from skills.sh

The [skills.sh](https://skills.sh) ecosystem distributes shareable skills via `npx skills`. To install one and track it in this repo:

```bash
# 1. Install globally as a real directory. --copy bypasses the default
#    node_modules symlink so the files actually land under ~/.claude/skills/<name>/.
npx skills add <owner>/<repo> -g --copy

# 2. Promote into the repo (moves the dir, symlinks ~/.claude/skills/<name> back):
bash ~/Code/tools/binbits/claudebits/commands/promote.sh <name>

# 3. Commit:
cd ~/Code/tools/binbits && git add claudebits/skills/<name> && git commit
```

Browse the catalog at <https://skills.sh> or use `npx skills find` interactively. To preview a repo's skills without installing: `npx skills add <owner>/<repo> -l`.
