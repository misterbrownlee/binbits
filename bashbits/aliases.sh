# ---------------------------------
#      Aliases go in here

# -------------------------
# general stuff
#
alias clock='tty-clock -C 3'
alias devbotwut='echo "$DEVBOT_PASSWD"'
alias epoch='date "+%s"'
alias ff='findfile'
alias findfile='find . -name'
alias fixbash='edit $DOTFILES_PATH'
alias fixgit='edit ~/bin/gitbits'
alias gs='gulp serve'
alias ip='ifconfig | grep broadcast\ '
alias iplan='ifconfig en3 | grep inet\ '
alias ipwifi='ifconfig en0 | grep inet\ '
alias ll='ls -lah'
alias now='date +"%m-%d-%Y %T"'
alias passgen='openssl rand -base64 32'
alias pingit='ssh -T git@github.com'
alias pingitcorp='ssh -T $ADOBE_GITHUB'
alias psrv='wsvr'
alias reload-bash='rlbash'
alias rlb='rlbash'
alias rlbash='. ~/.bash_profile'
alias sauce='sc -u brownlee -k $SAUCE_ACCESS_KEY'
alias shrug='echo -e "" && echo -e "  ¯\_(ツ)_/¯ "'
alias storeBgone='find . -name '*.DS_Store' -type f -delete'
alias stpkg='cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/'
alias timestamp='date +%s'
alias wsrv='wsvr'
alias wsvr='python -m SimpleHTTPServer'
# alias fix-ddwrt='NOW=`date "+%m%d%H%M%Y"`; ssh root@192.168.1.10'


# -------------------------
# navigations
# -------------------------
#
#  how lazy am I?  Pretty fucking lazy it turns out.
#
alias cd2='cdad'
alias back='cdl -'
alias code='cdad'
alias docs='cdl ~/Documents'
alias home='cdl ~'
alias mine='cdl ~'
alias desk='cdl ~/Desktop'
alias desktop='cdl ~/Desktop'
alias root='echo "YOU GOT NOTHIN"; cdl ~'
alias up='cd .. && ll'
alias cdup='cd .. && ll'
# alias cdcode='cdl ~/Documents/code'
# alias cdtools='cdl ~/Documents/code/tools'
# alias cdxd='cdl ~/Documents/code/adobe-design'
# alias cdfoo='cdl ~/Documents/code/mine'
# alias cdmine='cdl ~/Documents/code/mine'
# alias components='cdcomponents'
# alias cmpt='cdcomponents'
# alias coralui='cdcoralui'
# alias coral='cdad coral'
# alias cui='cdcoralui'
# alias xd='cdad'
# alias ad='cdad'
# alias dna='cdad dna'
# alias cddna='cdad dna'
# alias css='cdad css'
# alias cdcss='cdad css'
# alias bal='cdad bal'
# alias cdbal='cdad bal'


# -------------------------
# building things
# -------------------------
#
alias dev='nrd'
alias gcc='xcrun gcc'
#alias dev='grunt dev --connect-port='
# alias bdd='grunt default dev --devOnly'
# alias bddd='grunt default dev-dist'
# alias bd3='bddd'
# alias bdebug='node-debug /usr/local/lib/node_modules/grunt-cli/bin/grunt'


# -------------------------
# editor foo
# -------------------------
#
alias atom='open -a Atom'
alias brak='open -a Brackets'
alias edit-profile='fixbash'
# alias edit='subl'
alias edit='open -a /Applications/Visual\ Studio\ Code.app/'
alias here='edit .'
alias this='here --background'

# -------------------------
# softwares
# -------------------------
#
alias chrome='open -a /Applications/Google\ Chrome.app'
alias vox='open -a Vox'

# -------------------------
# mongo
# -------------------------
#
alias gomon='echo "staring mongo daemon..."; mongod --config /usr/local/etc/mongod.conf'
# alias upmongo='launchctl load /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist'
# alias downmongo='launchctl unload /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist'


# -------------------------
# npm
# -------------------------
#
alias i='npm i'
alias is='npm i --save'
alias isd='npm i --save-dev'
alias minty_lite='nn; echo "fetching from git and merging master"; git up; ni; nr build'
alias ni="echo 'installing via npm...'; shrug; plzhold; echo ""; npm install; say "BOOM"; plzstop; osascript -e 'display notification \"BOOM! installed!\"'";
alias nln='npm link'
alias nn='echo "removing node_modules..." && rm -rf node_modules'
alias nr='npm run'
alias nuke-node-modules='fragFolder node_modules'
# alias nr-b='npm run build'
# alias nr-d='npm run dev'
# alias nr-s='npm run serve'
# alias nr-t='npm run -s test'

# -------------------------
# yarhnnnn
# -------------------------
alias yr='yarn run'
alias yi='yarn install'

# -------------------------
# git - aliases for .gitconfig aliases because typing
# -------------------------
#
alias g='git'
alias ga='g a'
alias gclone='clone'
alias gcm='g cm'
alias gdiff='g diff'
alias glog='git log --graph --pretty="format:%C(yellow)%h%Cgreen%d%Creset %s %C(white) %an, %ar%Creset"'
alias gpo='g p origin'
alias gst='g st'

alias fetch='git fetch'
alias main='g main'
alias nuke='git nuke'
alias prune='git prune'
alias unstage='g unstage'

#alias gac='g ac'
#alias gb='g b'
#alias gba='g ba'
#alias gc='g c'
#alias gco='g co'
#alias gnb='g nb'
#alias gplm='g plm'
#alias gpm='g pm'

# markdown-cheat remind me I haz stupid
# so I can actually use them
alias markdown-cheat="open -a /Applications/Google\ Chrome.app https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet"

# -------------------------
# super random lolz
# -------------------------
#
alias ding='afplay $SOUNDS_PATH/Ping.aiff'
alias bitch='sudo' # kristofer joseph <3
alias makes-me-a-sandwich='echo "make it yourself, $USER..."'
alias beerme='echo "WOOOOOOOOOOO! 🍺 🍺 🍺 🍺 🍺 🍺 !!!!!!!!!"'

# -------------------------
# memory lane
# -------------------------
#
# alias safp='/Users/brownlee/projects/tools/fpdebugger/standaloneplayer.app/Contents/MacOS/fp'
# alias opendb='open -a  /Applications/Utilities/SQLite\ Database\ Browser\ 2.0\ b1.app/'
# alias logcat='adb logcat'
# alias mnt='adb shell'
