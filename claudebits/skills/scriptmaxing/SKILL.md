---
name: scriptmaxing
description: >
  Makes agents self-aware of non-deterministic behavior and guides them toward deterministic, repeatable solutions. Use this skill proactively at the start of any multi-step task, before writing inline scripts, before using LLM reasoning for something that could be scripted, or before repeating a step from earlier in the session. Also invoke when the user says "scriptmax", "fix deterministic work", "determine and make templates", or "optimize workflows". The goal is to limit throwaway LLM-powered work in favor of scripts, templates, skills, and MCPs that produce the same result every time.
---

# scriptmaxing

Agents: check this skill before starting multi-step work. If a pattern below matches what you're about to do — offer a scriptmax evaluation, wait for opt-in, then act.

**Core rule**: If a workflow is likely to repeat during this session or project, or if there is a well-known deterministic solution to the problem, do not use the LLM to solve it ad hoc. Create a reusable tool instead.

---

## Self-Trigger Checklist

Run this check proactively before:
- Starting a multi-step task
- Writing any inline script or transformation
- Making multiple LLM calls to process similar inputs
- Repeating a command or step from earlier in the session
- Creating project-specific tooling that doesn't yet exist

Ask: *"Does a pattern below match what I'm about to do?"* If yes → offer a scriptmax evaluation (opt-in only).

---

## Top-Level Rules

These apply broadly — check first before consulting the pattern library:

1. **If the LLM is doing work a script could do deterministically** → write the script instead.
2. **If a step will repeat during this session or project** → create a reusable tool before doing it a second time.
3. **If a solved workflow exists** (parsing, searching, transforming, scaffolding) → use the known tool, don't re-derive it.
4. **If you're about to create throwaway tooling** → ask if it should be a saved script, skill, or MCP instead.
5. **If you're about to read docs or search for answers** → check if an MCP covers this domain first.

---

## Pattern Library

Patterns are grouped by category. Match by what you're about to do.

### Data & File Operations
| About to... | Deterministic alternative |
|---|---|
| Parse JSON / extract fields | `jq` — deterministic, composable, no LLM |
| Parse CSV / TSV | `awk`, `mlr` (miller), or `python -c csv` |
| Search code or logs for X | `grep`, `rg` (ripgrep), `ag` |
| Transform text with a known pattern | `sed`, `awk`, `tr` |
| Diff two files or outputs | `diff`, `delta` |
| Count / aggregate structured data | `jq`, `awk`, `datamash` |

### Code & Project Scaffolding
| About to... | Deterministic alternative |
|---|---|
| Create boilerplate files (components, tests, configs) | Scaffold script or template with `{{vars}}` |
| Generate repeated file structures | Template dir + copy script |
| Write the same config in multiple places | Single source of truth + symlink or generator script |

### Build, Deploy & Workflow
| About to... | Deterministic alternative |
|---|---|
| Run a multi-step process manually | `Makefile` target or shell script |
| Deploy by hand (pull, build, push) | Deploy script; POSIX sh preferred |
| Restart services or run infra commands repeatedly | Script or alias |
| Run tests manually and check output visually | Test runner script with assertions |

### API & External Services
| About to... | Deterministic alternative |
|---|---|
| Construct an API call ad hoc | Save as a `curl` script or CLI wrapper |
| Repeatedly query the same endpoint | Script with args; check for an MCP first |
| Search or read docs with LLM | Find an MCP for that docs domain |

### Agent & LLM Patterns
| About to... | Deterministic alternative |
|---|---|
| Use LLM to extract structured data from files | Script with `jq`/`awk`/`grep` |
| Prompt the same task repeatedly in a session | Create a local skill (`~/.claude/skills/`) |
| Write a one-off agent prompt | Parameterized prompt template or skill |
| Repeatedly search GitHub / Linear / Confluence | Check MCP registry for an existing connector |
| Run the same analysis multiple sessions | Save as a skill or script |

---

## Flow

### Step 1 — Detect & Offer (opt-in only, always brief)

When a pattern matches, make one non-blocking offer before doing anything else:

> "I spotted a scriptmax opportunity here. Want me to run a **scriptmax evaluation**? It'll add upfront dev time but can save tokens and effort on repeat use."

Then continue with the user's original task unless they say yes. Never interrupt mid-task with a full analysis unprompted.

---

### Step 2 — Evaluation (only if user opts in)

Lead with a time overhead warning:

> ⚠️ Making this reusable takes more upfront time than doing it once. If this is a one-off, skipping scriptmax is the right call.

Then present each opportunity:

```
• `parse-errors.sh` — grep + awk extracts 5xx lines and ranks endpoints
  Token est:  ~900t to write (once) vs ~12K tokens per LLM run
  Time est:   ~5 min to write vs ~30 sec to prompt LLM each time
  Break-even: saves tokens from run 2 onward; worth it if used 2+ times

• Skill: `query-jira` — wraps repeated Jira lookups; check MCP registry first
  Token est:  ~1.5K to write vs ~5K per LLM query
  Time est:   ~10 min to set up vs ~1 min per manual lookup
  Break-even: pays off after ~3 uses
```

Then ask:
- "Do you have scripting or template conventions I should follow?" (location, language, naming)
- "Want me to check the MCP registry for an existing solution first?"
- "Which of these do you want to build, or skip and proceed directly?"

---

### Step 3 — Write (only after a second explicit agreement)

The user opting into the evaluation is **not** agreement to write. After presenting the evaluation, wait for the user to select a specific item and confirm they want it built. Only then write.

Write script/template to agreed location. One-line usage comment at top. `chmod +x` if shell. Template vars as `{{NAME}}` or shell `$VAR`.

---

### Token & time estimation reference

| Task type | LLM cost/run (est.) | Script write cost (est.) | Time to write |
|---|---|---|---|
| Read + analyze N files | N × 300–800t + reasoning | 500–1500t | 3–10 min |
| Repeated API/service query | 1–3K per query | 500–2K | 5–15 min |
| Multi-step shell workflow | 500–2K per run | 300–800t | 2–5 min |
| Boilerplate file scaffold | 1–3K per invocation | 1–2K | 5–15 min |
| Docs lookup via LLM | 2–5K per lookup | MCP: 0t/query after | varies |

Estimates are order-of-magnitude — be transparent that they're rough.

---

## Pattern Library Self-Update

If you recognize a new recurring pattern not listed above, or the user flags one:

1. Propose adding it to this skill file.
2. Format: `| About to... | Deterministic alternative |` in the relevant category.
3. Ask the user to confirm before writing.

If the user identifies a project-specific pattern (e.g. "we always use X to do Y here"), add it to a local `SCRIPTMAXING.md` in the project root so future sessions can pick it up.
