DOTFILES_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "  loading functions..."

# ------------------------------------------------
# make a directory and change to it
# I wish I used this more but I'm too stupid to remember
#
function mkcd() {
    mkdir $1; cd $1
}


# ------------------------------------------------
# frag a named directory in all directories one level below this
# mostly used to reclaim disk space from node_modules madness
#
function fragFolder {
  # could just try find . -type d -maxdepth 2 -name "*$1*" -exec rm -ri {} \;
  # but this works and I like the echo messages better

  FRAG_TARGETS=`find . -type d -maxdepth 2 -name *$1*`

  if [ -z "$FRAG_TARGETS" ]
  then
    echo "No targets found."
  fi

  for target in $FRAG_TARGETS; do
    echo "fragging $target"
    rm -rf $target
  done;
}


# ------------------------------------------------
# this is a nice idea for making a list of cd targets
# and a shortcut for using them
# and it never caught on
# because muscle memory is way easier to configure I guess
#
function cd2() {

  RAW_PLACES=$(< ~/bin/randombits/places.txt)
  declare -a places=(RAW_PLACES)
  WHAT="$1"
  WHERE="${!places[$1]}"
  echo "cd to $WHAT; which is $WHERE"
}



# ------------------------------------------------
# start playing hold music
# because you hate yourself
#
function plzhold() {
  sh -c "afplay ~/bin/randombits/hold.mp3 &"
}


# ------------------------------------------------
# stop playing hold music
#
function plzstop() {
  ps ax | grep afplay | grep -v grep | awk '{print "kill " $1}' | sh
}


# ------------------------------------------------
# create a file and open it
# I never use this btw
#
function rmd() {
  pandoc $1 | lynx -stdin
}

# ------------------------------------------------
# create a file and open it
# I pretty much also never use this lol
#
function newfile() {
  touch $1; edit $1
}


# ------------------------------------------------
# create a directory and change to it
#
function mkcdir() {
  mkdir -p "$1"; cd "$1";
}


# ------------------------------------------------
# new terminal window at current location
#
function nwh() {
    osascript -e 'on run argv
        tell app "Terminal"
            do script "cd " & item 1 of argv
        end tell
    end run' `pwd`
}


# ------------------------------------------------
# make karma not try to find phantom.js
# hopefully this crap is never part
# of my life again, plx
#
# function togglePhantom() {
#   if [ -z "$JENKINS_URL" ]
#   then
#     echo "setting JENKINS_URL=1"
#     export JENKINS_URL=1
#   else
#     echo "unset JENKINS_URL"
#     unset JENKINS_URL
#   fi
# }

# ------------------------------------------------
# this makes the cow and a cat tell me if I have an IP yet
#
function ipmeow() {
  STOP=${1:-15}
  MEOW=0
  until [ $MEOW = $STOP ]; do
      ip | cowsay
      echo -e '  meow!  (=^ ◡ ^=)'
      ((MEOW++))
      sleep 3
  done
}

# ------------------------------------------------
# it makes the cow tell me if I have an IP yet
# or the cow gets the hose
#
function ipcow() {
  STOP=${1:-15}
  FAKE_MOOZ=0
  until [ $FAKE_MOOZ = $STOP ]; do
      clear
      ip | cowsay
      echo -e " $FAKE_MOOZ"
      ((FAKE_MOOZ++))
      sleep 3
  done
}


# ------------------------------------------------
# freshen up an npm based repository
#
function minty() {
  say -v Zarvox "begin"
  if [[ -d node_modules ]]; then
    nn
  else
    say "no nuke for you"
  fi
  git up || { return; }
  ni || { return; }
  grunt || { return; }
}


# ------------------------------------------------
# lazy peeps one word clone a repo from github;
# args are [orgname] [repo]
#
function clone {
  echo " trying github clone of $1:$2"
  git clone git@github.com:$1/$2.git
}


# ------------------------------------------------
# even moar lazy clone from misterbrownlee
#
function meclone {
  echo " trying git clone of misterbrownlee:$1"
  clone misterbrownlee $1
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
# clone a coralui component repo, because typing
# which is a project that collapsed under its own weight
# because it was too awesome for its own good
#
# function cclone() {
#   echo " trying git clone $ADOBE_GITHUB:Coral/coralui-component-$1"
#   git clone $ADOBE_GITHUB:Coral/coralui-component-$1 $1
# }


# ------------------------------------------------
# tag a git repo with a floating tag
#
function tagfloat() {
  VERSION=$1
  FLOATING_TAG=$2
  git tag -d $FLOATING_TAG
  git push origin :refs/tags/$FLOATING_TAG || { return; }
  git tag -a $FLOATING_TAG $VERSION -m "@releng - $FLOATING_TAG floating tag based on $VERSION" || { return; }
  git push origin $FLOATING_TAG || { return; }
}


# ------------------------------------------------
# tag a git repo with a #pre-release (floating) tag
#
function tagpre() {
  VERSION=$1
  git tag -d pre
  git push origin :refs/tags/pre-release || { return; }
  git tag -a pre-release $VERSION -m "@releng - pre-release tag based on $VERSION" || { return; }
  git push origin pre-release || { return; }
}


# ------------------------------------------------
# pre-release and tag a git repo
#
function releasepre() {
  VERSION=$1
  # todo: warn if modules linked
  # todo: npm install latest
  git tag -d pre-release
  git checkout master || { return; }
  git pull origin master || { return; }
  git checkout pre-release || { return; }
  git pull origin pre-release || { return; }
  git merge master -m '@releng - merge master into pre-release' || { return; }
  npm i || { return; }
  grunt release || { return; } # todo: pass version here
  tagpre $VERSION || { return; }
  git checkout master
}


# ------------------------------------------------
# delete a tag, on earth as it is in heaven, ahhhhh mens yeah
# args are just the tag name, of course, you dolt
#
function rmtag() {
  git tag -d $1
  git push origin :refs/tags/$1
}


# ------------------------------------------------
# shortcuts to pop into a dev directory and list its folders in one move
# I never use the fancy parts of this, but it's a cool idea
# just the shortcut to the main dev folder is nice tho
#
function cdad() {

  WHAT="${COLOR_LIGHT_GREEN}cdad"
  WHAT+=" $1${COLOR_NC}"

  echo -e "\nYou say $WHAT like I should know what that means...\n"

  case "$1" in
    dna)
      echo -e "Oh ... $WHAT is mapped to dna.corp!\n"
      cdl "$AD_CODE_ROOT/dna.corp"
      return
      ;;
    css)
      echo -e "Hmm ... $WHAT is mapped to spectrum-css!\n"
      cdl "$AD_CODE_ROOT/spectrum-css"
      return
      ;;
    sr)
      echo -e "Ok ... $WHAT takes you to site-resources\n"
      cdl "$AD_CODE_ROOT/site-resources"
      return
      ;;
    bal)
      echo -e "Ah ha ... $WHAT is mapped to balthazar!\n"
      cdl "$AD_CODE_ROOT/balthazar"
      return
      ;;
    *)
      echo -e "$WHAT is not something I know about... \n"
      echo -e "I'll just cd to ${COLOR_LIGHT_GREEN}$AD_CODE_ROOT/$1${COLOR_NC}\n"
      ;;
  esac

  cd "$AD_CODE_ROOT/$1" && ll && printf "Now in \033[0;35m$PWD\n"
}

function cdl() {
  cd "$@" && ll && printf "\nArrived at: ${COLOR_LIGHT_BLUE}$PWD\n";
}

# ------------------------------------------------
# this looks for nvm config and uses it if found
# you could make this run on every cd
# but you'd be pretty fucking stupid if you did
#
function checkNvm() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

# ------------------------------------------------
# this juggles your .npmrc files so you can push to different targets
# like '.npmrc-prod' or '.npmrc-sandbox' or '.npmrc-clusterfuck'
#
# do you hate the node.js ecosystem?
# kinda? even just a little?
# well, you should.
# and I do.
# it's a fucking train wreck.
#
function npmrcSwitch() {
  echo "Switching to the $1 .npmrc configuration"
  mv ~/.npmrc ~/.npmrc-last
  cp ~/.npmrc-last ~/.npmrc-undo
  cp ~/.npmrc-$1 .npmrc
}


