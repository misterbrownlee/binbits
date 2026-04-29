---
name: standup
description: This skill should be used when the user asks for a "standup", "standup summary", "what did I work on", "yesterday's work", "recent git work", "what have I been doing", or wants a summary of recent commits for a status update or daily standup.
version: 1.0.0
---

# Standup Summary Skill

Generate a concise standup-style summary of recent git work in the current repo.

## Steps

1. Run `git log --oneline --author="$(git config user.name)" --since="3 days ago"` to get recent commits
2. Run `git log --oneline --since="3 days ago"` if the above returns nothing (in case user.name varies)
3. Group commits by day
4. Summarize in standup format: what was done, grouped by theme not by commit

## Output Format

Write in plain prose, not bullet lists of commit messages. Translate technical commit messages into human-readable work descriptions. Keep it to 3-5 sentences max.

**Example output:**
> Yesterday I refactored the auth middleware to fix a session token compliance issue and updated the related tests. Also cleaned up some stale config files and bumped the CI pipeline to Node 20.

## Notes

- If asked for a specific date range, adjust the `--since` flag accordingly
- Default to last 3 days if no timeframe specified
- Skip merge commits — focus on actual work
- If the repo has no recent commits from the user, say so clearly
