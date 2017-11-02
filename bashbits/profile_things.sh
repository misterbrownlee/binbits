
# ----------------------
# stuff to load via ~/.profile
#
# which is here because I don't want ~ to be a git repo thx
# only stuff not specific to bash ... good for all shells
#

export DOTFILES_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "   --> imma gonna from $DOTFILES_PATH"

. $DOTFILES_PATH/aliases.sh
. $DOTFILES_PATH/path_stuff.sh
