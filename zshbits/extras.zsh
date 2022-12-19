## this file is synlinked to ~/.oh-my-zsh/custom
#
echo "$fg[green][binbits]$reset_color loading extras.zsh"

# make homebrew completions work
# maybe
#
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"


# node complains about ulimit sometimes
#
ulimit -S -n 2048

