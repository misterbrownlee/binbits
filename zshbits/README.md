# zshbits

Zsh configuration: aliases, functions, prompt theme, and profile/rc extras.

- `aliases.zsh` - shell aliases
- `functions.zsh` - shell functions
- `extras.zsh` - misc extras
- `coloring.sh` - color variable definitions
- `z_greeting.zsh` - login greeting
- `zprofile-xtra.sh` - sourced from `~/.zprofile`
- `zshrc-xtra.sh` - sourced from `~/.zshrc`
- `meowxmeow.zsh-theme` - oh-my-zsh prompt theme

## Setup

Oh My Zsh automatically sources any `*.zsh` files found in `~/.oh-my-zsh/custom/` and loads custom themes from `~/.oh-my-zsh/custom/themes/`. Wire these up by symlinking the repo files into those directories:

```bash
# Custom config scripts (auto-sourced by Oh My Zsh)
ln -sf ~/Code/binbits/zshbits/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
ln -sf ~/Code/binbits/zshbits/extras.zsh ~/.oh-my-zsh/custom/extras.zsh
ln -sf ~/Code/binbits/zshbits/functions.zsh ~/.oh-my-zsh/custom/functions.zsh
ln -sf ~/Code/binbits/zshbits/z_greeting.zsh ~/.oh-my-zsh/custom/z_greeting.zsh

# Prompt theme
ln -sf ~/Code/binbits/zshbits/meowxmeow.zsh-theme ~/.oh-my-zsh/custom/themes/meowxmeow.zsh-theme
```

To activate the theme, set `ZSH_THEME="meowxmeow"` in `~/.zshrc`, then reload with `source ~/.zshrc` (or `rlz`).
