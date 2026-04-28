# Claude Skills Reference

Skills are invoked with `/skill-name` in Claude Code. Global skills live in `~/.claude/skills/<name>/SKILL.md` and are available across all projects.

## Global Skills (custom, in `~/.claude/skills/`)

| Skill | Invoke | What it does |
|---|---|---|
| standup | `/standup` | Summarizes recent git commits into a plain-English standup update |
| explain-script | `/explain-script` | Explains a shell script (bash/zsh) in plain English, including gotchas |

## Built-in Skills (Anthropic-provided)

| Skill | Invoke | What it does |
|---|---|---|
| update-config | `/update-config` | Edits `settings.json` — hooks, permissions, env vars, automated behaviors |
| keybindings-help | `/keybindings-help` | Customizes `~/.claude/keybindings.json` (rebind keys, chord shortcuts) |
| simplify | `/simplify` | Reviews changed code for reuse, quality, and efficiency; fixes issues |
| less-permission-prompts | `/less-permission-prompts` | Scans transcripts and adds allowlist entries to reduce permission prompts |
| loop | `/loop` | Runs a prompt or command on a recurring interval (self-paced or timed) |
| schedule | `/schedule` | Creates/manages scheduled remote agents running on a cron schedule |
| claude-api | `/claude-api` | Builds, debugs, and optimizes Claude API / Anthropic SDK apps |
| init | `/init` | Initializes a `CLAUDE.md` file with codebase documentation |
| review | `/review` | Reviews the current pull request |
| security-review | `/security-review` | Security review of pending changes on the current branch |

## Adding a New Global Skill

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

Changes take effect immediately — no restart needed.
