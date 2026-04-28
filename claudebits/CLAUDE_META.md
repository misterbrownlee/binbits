// this is very meta
// copy this file to project root when we're clauding

# binbits

Personal dotfiles and configuration repo. Cloned to `~/bin` on new machines.

## Structure

- `bashbits/` - bash startup scripts (bash_profile, bashrc, profile examples + sourced helpers)
- `zshbits/` - zsh config (aliases, extras, greeting, zprofile/zshrc extras, oh-my-zsh theme)
- `gitbits/` - git config (gitignore_global; symlinked to `~/.gitconfig`, `~/.gitignore_global`)
- `sublimebits/` - Sublime Text 3 settings, keymaps, themes (symlinked into ST3 Packages/User)
- `terminalbits/` - Terminal.app themes
- `scriptybits/` - standalone utility shell scripts
- `dotrcbits/` - misc dotrc files (ackrc, rsyncExclude)
- `cheatbits/` - quick reference markdown cheat sheets
- `randombits/` - miscellaneous (terminal themes, hold music)
- `claudebits/` - Claude Code global config (symlinked into `~/.claude/`)

## Setup (on a new machine)

```bash
cd ~
git clone git@github.com:misterbrownlee/binbits.git bin
cd bin
ln -s ~/bin/gitbits/gitignore_global ~/.gitignore_global
ln -s ~/bin/claudebits/CLAUDE_GLOBAL.md ~/.claude/CLAUDE.md
# Source bashbits or zshbits files from ~/.bash_profile / ~/.zshrc as needed
# Install Claude Code skills per ~/bin/claudebits/skills/SKILLS_WE_LIKE.md
```

## Notes

- No build system, package manager, or tests — this is purely config/script files.
- Scripts are shell (bash/zsh). No compilation step.
- Main branch is `main`.
