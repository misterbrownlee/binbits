# gitbits

Git configuration: `git-config` (aliases, defaults) and `gitignore_global`.

## Setup

These files are typically installed by symlinking the repo copy into the user's home directory:

```bash
ln -sf ~/Code/binbits/gitbits/git-config ~/.gitconfig
ln -sf ~/Code/binbits/gitbits/gitignore_global ~/.gitignore_global
```

That keeps the project config under version control while making Git use it as the active global config and ignore file.

The included `git-config` might need an edit to get the right name/email in there. Lately we're using the 1Password SSH agent for auth stuff (`~/.1password/agent.sock`, configured in `zshbits/extras.zsh`). Update the name and email values before symlinking
