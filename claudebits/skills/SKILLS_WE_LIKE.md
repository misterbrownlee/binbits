# Skills We Like

Log of Claude Code skills installed at `~/.claude/skills/`. Not tracked in git — this file is a catalog for reference and reinstallation.

## Installing a Skill

Skills live as directories under `~/.claude/skills/<skill-name>/SKILL.md`.

To install a skill from the Claude Code registry:
```bash
claude skills install <skill-name>
```

To install manually (e.g. from a gist or local file):
```bash
mkdir -p ~/.claude/skills/<skill-name>
# paste or copy SKILL.md into that directory
```

To list installed skills:
```bash
ls ~/.claude/skills/
```

---

## Installed Skills

### explain-script
- **Source:** Claude Code built-in registry
- **Install:** `claude skills install explain-script`
- **Trigger:** "explain this script", "what does this shell script do", "break down this bash/zsh"
- **What it does:** Explains shell scripts section-by-section in plain English; flags risky patterns and non-obvious idioms.

### standup
- **Source:** Claude Code built-in registry
- **Install:** `claude skills install standup`
- **Trigger:** "standup", "what did I work on", "yesterday's work", "recent git work"
- **What it does:** Generates a concise standup summary from recent git commits, grouped by theme not by commit message.
