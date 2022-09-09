
# ---------------------------------
#      Functions go in here
#


# ------------------------------------------------
# make a directory and change to it
# I wish I used this more but I'm too stupid to remember
#
function mkcd() {
    mkdir $1; cd $1
}

# fire up VS Code
function vscode() {
  open -a /Applications/Visual\ Studio\ Code.app/ $1
}


# ------------------------------------------------
# because osx sucks
#
function unfuckWebcam() {
    sudo killall VDCAssistant;
    sudo killall AppleCameraAssistant;
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

function ackOnceForEvery {
  xargs -0 -n 1 ack --ignore-file=is:acked.txt < <(tr \\n \\0 <$1) >> acked.txt
}


# ------------------------------------------------
# this is a nice idea for making a list of cd targets
# and a shortcut for using them
# and it never caught on
# because muscle memory is way easier to configure I guess
#
# function cd2() {

#   RAW_PLACES=$(< ~/bin/randombits/places.txt)
#   declare -a places=(RAW_PLACES)
#   WHAT="$1"
#   WHERE="${!places[$1]}"
#   echo "cd to $WHAT; which is $WHERE"
# }

# function mongup {
#   echo 'staring mongo daemon'
#   mongod --fork --logpath ~/.mongloog/mongo.log --config /usr/local/etc/mongod.conf
# }

# function mongcheck {
#   yep=`ps ax | grep mongod | grep -v grep`
#   [ -z "$yep" ] && echo "nope" || echo "mongod: $yep"
# }

# function mongtail {
#   tail -f -n 100 ~/.mongloog/mongo.log
# }

# function mongdown {
#   ps ax | grep mongod | grep -v grep | awk '{print "kill " $1}' | sh
#   echo 'shutdown mongo ok'
# }

# function mongclean {
#   rm -r ~/.mongloog/*
# }



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

function clearLastLine() {
  # because maybe this works
  tput cuu 1 && tput el
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
  STOP=${1:-6}
  MEOW=1
  until [ $MEOW = $STOP ]; do
      MESSAGE=`ip`;
      MESSAGE+=$'\n\n+++++++++++++++++++++++++++\n'
      MESSAGE+=$'\n\ninside:\n'
      MESSAGE+=`ping -c 1 $ADOBE_INSIDE`
      MESSAGE+=$'\n\n+++++++++++++++++++++++++++\n'
      MESSAGE+=$'\n\nyahoo:\n'
      MESSAGE+=`ping -c 1 yahoo.com`
      MESSAGE+=$'\n\n'
      cowsay -f small "$MESSAGE"
      echo -e "\n\n $MEOW meow!  (=^ ◡ ^=)\n\n"
      ((MEOW++))
      sleep 3
  done
}

function dns-yeller() {
  STOP=${1:-60}
  MEOW=1
  WHERE=${1:-$ADOBE_INSIDE}
  echo "Let's ping $WHERE"
  echo -n " trying meow "
  until [ $MEOW = $STOP ]; do
    ping -W 500 -c 1 $WHERE &> /dev/null
    if [ $? -eq 0 ]; then
      echo "and it's OK!"
      ip
      break;
    else
      echo -n "."
    fi
    ((MEOW++))
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
  buildit || { return; }
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

function tagBetaSpectrum {
   npm dist-tag add @spectrum/$1 beta
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
  echo -e "changing dir to ${COLOR_LIGHT_GREEN}$AD_CODE_ROOT/$1${COLOR_NC}\n"
  cd "$AD_CODE_ROOT/$1" && ll && printf "Now in ${COLOR_LIGHT_GREEN}$PWD\n"
}

function cdl() {
  cd "$@" && ll && printf "\nArrived at: ${COLOR_LIGHT_BLUE}$PWD\n";
}

# ------------------------------------------------
# this looks for nvm config and uses it if found
# you could make this run on every cd
# but you'd be pretty fucking stupid if you did
#
# function checkNvm() {
#   if [[ -f .nvmrc && -r .nvmrc ]]; then
#     nvm use
#   elif [[ $(nvm version) != $(nvm version default)  ]]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }

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
# function switchNpmrc() {
#   echo -e "\nSwitching to the $1 .npmrc configuration"
#   # mv ~/.npmrc ~/.npmrc-last
#   # cp ~/.npmrc-last ~/.npmrc-undo
#   cp ~/.npmrc-$1 ~/.npmrc
#   echo -e "\nnow it's be like:\n"
#   cat ~/.npmrc
# }

function recurseReplace() {
  find ./ -type f -maxdepth 2 -name '$1' -exec sed -i '' $2 {} \;
}


function setupAF() {
  curl -u$MY_LDAP_USERNAME:$ARTIFACTORY_API_KEY $SPECTRUM_ARTIFACTORY_RELEASE 
}


