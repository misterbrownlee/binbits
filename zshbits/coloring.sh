echo 'yay coloring'

# here are slightly dederped color variables
# for configing... don't change these seriously k thx
# probably none of this works on linux, so they have to suck it
#
LS_BLACK="a"
LS_RED="b"
LS_GREEN="c"
LS_BROWN="d"
LS_BLUE="e"
LS_MAGENTA="f"
LS_CYAN="g"
LS_GREY="h"

# boldy go yeeh
#
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
#
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

# and make the thing
#
LS_COLORS="$DIRECTORY $SYMLINK $SOCKET $PIPE $EXECUTABLE $BLOCK_SPECIAL $CHARACTER_SPECIAL"
LS_COLORS="$LS_COLORS $EXECUTABLE_SETUID $EXECUTABLE_SETGID $DW_WITH_T $DW_WITHOUT_T"

# and give a plenty
export LSCOLORS="${LS_COLORS//[[:space:]]/}"
export CLICOLOR=1