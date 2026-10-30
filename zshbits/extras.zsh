## this file is synlinked to ~/.oh-my-zsh/custom
#
echo "$fg[green][binbits]$reset_color loading extras.zsh"

# make homebrew completions work
# maybe
#
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# 1Password SSH agent (symlinked from ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock)
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"


# node complains about ulimit sometimes
#
ulimit -S -n 2048

