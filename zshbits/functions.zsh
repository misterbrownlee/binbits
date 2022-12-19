## this file is synlinked to ~/.oh-my-zsh/custom
#
echo "$fg[green][binbits]$reset_color loading functions.zsh"


# ------------------------------------------------
# lazy peeps one word clone a repo from github;
# args are [orgname] [repo]
#
function clone {
  echo " trying github clone of $1:$2"
  git clone git@github.com:$1/$2.git
}


# ------------------------------------------------
# clone a repo from Adobe github; YOU CANNOT HAZ
# args are [orgname] [repo]
#
function aclone {
  echo " trying git clone $ADOBE_GITHUB:$1/$2.git"
  git clone $ADOBE_GITHUB:$1/$2.git
}


# ------------------------------------------------
# probably just use jump now, because 2022
# fast change to a specific code project
# assuming you want the adobe stuff, not tools or whatever
# args are [orgname] [repo]
#
# function cdad() {
#   WHAT="${COLOR_LIGHT_GREEN}cdad"
#   WHAT+=" $1${COLOR_NC}"
#   echo -e "changing dir to ${COLOR_LIGHT_GREEN}$AD_CODE_ROOT/$1${COLOR_NC}\n"
#   cd "$AD_CODE_ROOT/$1" && ll && printf "Now in ${COLOR_LIGHT_GREEN}$PWD\n"
# }



# ------------------------------------------------
# start playing hold music
# because you hate yourself
#
function plzhold() {
  sh -c "afplay ~/Code/tools/binbits/randombits/hold.mp3 &"
}


# ------------------------------------------------
# stop playing hold music
#
function plzstop() {
  ps ax | grep afplay | grep -v grep | awk '{print "kill " $1}' | sh
}


# ------------------------------------------------
# output the spectrum thing that goes in your .npmrc
#
function spectrumAF() {
  curl -u$MY_LDAP_USERNAME:$ARTIFACTORY_API_KEY $SPECTRUM_ARTIFACTORY_RELEASE 
}


# ------------------------------------------------
# output the a4u thing that goes in your .npmrc
#
function a4uAF() {
  curl -u$MY_LDAP_USERNAME:$ARTIFACTORY_API_KEY $SPECTRUM_ARTIFACTORY_RELEASE 
}