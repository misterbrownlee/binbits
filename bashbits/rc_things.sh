
# ---------------------------------
# things to source from .bashrc
#
# any shell would love to have these bits
# note that the root path has to be exported first mkay
# and everything here must be able to hunt wabbits
#

# DOTFILES_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# echo "can haz $DOTFILES_PATH"


# ---------------------------------
# check if bashrc loaded aliases
#
alias | grep -q 'make-me-a-sandwich' && echo '   --> aliases loaded == yay'


# ---------------------------------
# load functions and check it
#
. $DOTFILES_PATH/functions.sh
type ipmeow | grep -q 'function' && echo '   --> functions loaded == yay'


# ---------------------------------
# load randomness
#
. $DOTFILES_PATH/wtf_over.sh


# ---------------------------------
# greet myself because I'm a nerd
#
. $DOTFILES_PATH/greeting.sh
