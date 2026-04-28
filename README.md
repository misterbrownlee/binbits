binbits
=======

# THIS README IS ALWAYS WRONG 

so watch y'self foo

Things for ~/bin, which includes bash startup stuff, git configuration, sublime text things, some hold music, and a picture of a naked lady.

PS. One of the above is a lie.

# Structure

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

# Set up

Generally, we clone this repo is to `~/Code/tools/binbits` or we get the hose. 

Configuration then is wired up by symlinking files from the user's home directory into the cloned repo.

Each subproject of this repo should have a "Setup" section in a `README.md`. I do try to keep this updated so future-me has it easier. Hopefully that has remained true.
