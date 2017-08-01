# the things that aren't teh others
echo '  loading wtf'

# --------------------------------
# ulimit which node likes to break a lot
ulimit -S -n 2048

# --------------------------------
# for git mostly
export EDITOR="subl -w"

# --------------------------------
#  colors codes              pair position in config string
#  --------------            ----------------------
#  (caps makes bold)         1 directory
#  a  black                  2 symbolic link
#  b  red                    3 socket
#  c  green                  4 pipe
#  d  brown                  5 executable
#  e  blue                   6 block special
#  f  magenta                7 character special
#  g  cyan                   8 executable with setuid bit set
#  h  light grey             9 executable with setgid bit set
#  x  default                10 directory writable to others, with sticky bit
#                            11 directory writable to others, without sticky bit

# here are slightly dederped color variables
# for configing... don't change these seriously k thx
# probably none of this works on linux, so they have to suck it
LS_BLACK="a"
LS_RED="b"
LS_GREEN="c"
LS_BROWN="d"
LS_BLUE="e"
LS_MAGENTA="f"
LS_CYAN="g"
LS_GREY="h"

# boldy go
LS_DARK_GREY="A" # wft is bold black srsly
LS_BOLD_RED="B"
LS_BOLD_GREEN="C"
LS_YELLOW="D" # aka bold brown if you're into that sort of thing
LS_BOLD_BLUE="E"
LS_BOLD_MAGENTA="F"
LS_BOLD_CYAN="G"
LS_BRIGHT_WHITE="H" # what even bold light gray ffs
LS_DEFAULT="x"

# this is the part you can fiddle with
DIRECTORY="$LS_CYAN $LS_DEFAULT"
SYMLINK="$LS_BOLD_GREEN $LS_BLUE"
SOCKET="$LS_BOLD_MAGENTA $LS_DEFAULT"
PIPE="$LS_BOLD_MAGENTA $LS_DEFAULT"
EXECUTABLE="$LS_RED $LS_BOLD_CYAN"
BLOCK_SPECIAL="$LS_BOLD_CYAN $LS_DEFAULT"
CHARACTER_SPECIAL="$LS_BOLD_CYAN $LS_DEFAULT"
EXECUTABLE_SETUID="$LS_DEFAULT $LS_DEFAULT"
EXECUTABLE_SETGID="$LS_DEFAULT $LS_DEFAULT"
DW_WITH_T="$LS_DEFAULT $LS_DEFAULT"
DW_WITHOUT_T="$LS_DEFAULT $LS_DEFAULT"

# this Darwin stuff no worky
# LS_COLORS="$DIRECTORY $SYMLINK $SOCKET $PIPE $EXECUTABLE $BLOCK_SPECIAL $CHARACTER_SPECIAL"
# LS_COLORS="$LS_COLORS $EXCUTABLE_SETUID $EXECUTABLE_SETGID $DW_WITH_T $DW_WITHOUT_T"
# export LSCOLORS="${LS_COLORS//[[:space:]]/}"

# here is lynn-yucks lscolors wtf string of goodness
# which I'm suprised even makes sense to a machine, let alone a people
# why do all programmers hate humans soo much? 
export LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:ex=00;35"
export CLICOLOR=1

# --------------------------------
# bash history
export HISTCONTROL=erasedups #ignoredups

# --------------------------------
# Some random colors

export COLOR_NC="\033[0m"
export COLOR_WHITE="\033[1;37m"
export COLOR_BLACK="\033[0;30m"
export COLOR_BLUE="\033[0;34m"
export COLOR_LIGHT_BLUE="\033[1;34m"
export COLOR_GREEN="\033[0;32m"
export COLOR_LIGHT_GREEN="\033[1;32m"
export COLOR_CYAN="\033[0;36m"
export COLOR_LIGHT_CYAN="\033[1;36m"
export COLOR_RED="\033[0;31m"
export COLOR_LIGHT_RED="\033[1;31m"
export COLOR_PURPLE="\033[0;35m"
export COLOR_LIGHT_PURPLE="\033[1;35m"
export COLOR_YELLOW="\033[0;33m"
export COLOR_LIGHT_YELLOW="\033[1;33m"
export COLOR_GRAY="\033[1;30m"
export COLOR_LIGHT_GRAY="\033[0;37m"

COLORS=(
  "$COLOR_LIGHT_PURPLE COLOR_LIGHT_PURPLE\n"
  "$COLOR_PURPLE COLOR_PURPLE\n"
  "$COLOR_LIGHT_BLUE COLOR_LIGHT_BLUE\n"
  "$COLOR_BLUE COLOR_BLUE\n"
  "$COLOR_LIGHT_CYAN COLOR_LIGHT_CYAN\n"
  "$COLOR_CYAN COLOR_CYAN\n"
  "$COLOR_LIGHT_GREEN COLOR_LIGHT_GREEN\n"
  "$COLOR_GREEN COLOR_GREEN\n"
  "$COLOR_YELLOW COLOR_YELLOW\n"
  "$COLOR_LIGHT_YELLOW COLOR_LIGHT_YELLOW\n"
  "$COLOR_LIGHT_RED COLOR_LIGHT_RED\n"
  "$COLOR_RED COLOR_RED\n"
  "$COLOR_LIGHT_GRAY COLOR_LIGHT_GRAY\n"
  "$COLOR_GRAY COLOR_GRAY\n"
  "$COLOR_WHITE COLOR_WHITE\n"
  "$COLOR_NC COLOR_NC\n"
)

function showColors() {
  for i in ${COLORS[@]}; do
    printf ${i}
  done
}

# --------------------------------
# Add git related details to prompt if available
# some set up around status coloring

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi

## add completetion for aliases
__git_complete g __git_main
__git_complete gco _git_checkout

# some prompt config
GIT_PS1_SHOWCOLORHINTS='yut'
GIT_PS1_SHOWUNTRACKEDFILES='kthx';
GIT_PS1_SHOWDIRTYSTATE='srsly'

# new prompt hotness
# PROMPT_COMMAND="__git_ps1 '$COLOR_GRAY\u$COLOR_LIGHT_GRAY@\h$YELLOW:\W $WHITE' ' \n➥ '"
# PROMPT_COMMAND="__git_ps1 '$COLOR_GRAY\u$COLOR_LIGHT_GRAY@\h$YELLOW:\W $WHITE' ' \n➥ '"
# PROMPT_COMMAND="__git_ps1 '\n$COLOR_BLUE\u$COLOR_LIGHT_GRAY@\h$YELLOW:\W $WHITE' ' \n➥ '"
# PROMPT_COMMAND="__git_ps1 '\n$COLOR_BLUE\u$COLOR_LIGHT_CYAN@$COLOR_LIGHT_RED\h$COLOR_LIGHT_YELLOW:\W $COLOR_LIGHT_GRAY' ' \n➥ $COLOR_NC'"
PROMPT_COMMAND="__git_ps1 '\n$COLOR_BLUE\u$COLOR_GRAY $COLOR_LIGHT_RED\h$COLOR_GRAY $COLOR_LIGHT_YELLOW\W$COLOR_NC' '$COLOR_LIGHT_GRAY\n=> '"

#export NVM_DIR="$HOME/.nvm"
#. "$(brew --prefix nvm)/nvm.sh"




