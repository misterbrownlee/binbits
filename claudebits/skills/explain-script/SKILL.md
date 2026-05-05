---
name: explain-script
description: This skill should be used when the user asks to "explain this script", "what does this shell script do", "break down this bash", "explain this zsh", "walk me through this function", or wants a plain-English explanation of a shell script or function.
version: 1.0.0
---

# Shell Script Explainer Skill

Explain shell scripts (bash, zsh, sh) in plain English — what they do, how they work, and any gotchas.

## Approach

1. Read the full script before explaining anything
2. Identify the overall purpose in one sentence
3. Walk through the key sections in order
4. Call out anything non-obvious: unusual flags, subtle side effects, assumptions about environment
5. Flag anything that looks risky (e.g. `rm -rf`, pipes to `sudo`, unquoted variables)

## Output Format

- Start with a one-line summary of what the script does
- Then explain section by section, in plain English
- Use inline code for specific commands/flags being referenced
- Note any dependencies (tools that must be installed, env vars that must be set)
- End with any caveats or things to watch out for

## Tone

Write for someone who knows programming but may not know every shell idiom. Don't patronize, but do explain things like `2>&1`, `${var:-default}`, or `set -euo pipefail` when they appear.
