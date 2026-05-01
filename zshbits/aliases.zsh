## this file is synlinked to ~/.oh-my-zsh/custom
#
echo "$fg[green][binbits]$reset_color loading aliases.zsh"

# I can't believe creating a file like this again in 2022
# because I'm a manager now ... super dilbert style
# what life choices led me to still care about these things?
#

alias cdad='cd ~/Code/adobe'
alias cdc='cd ~/Code'
alias edit='open -a /Applications/Visual\ Studio\ Code.app/'
alias ll='ls -lah' # oh my zsch does this too
alias nn='echo "removing node_modules..." && rm -rf node_modules'
alias nr='npm run'
alias rlz='source ~/.zshrc'
alias yr='yarn run'

# I keep hitting esc :w

# -------------------------
# gitty up
# -------------------------
alias g='git'
alias ga='g a'
alias gst='git st'
alias gdiff='g diff'
alias glog='git log --graph --pretty="format:%C(yellow)%h%Cgreen%d%Creset %s %C(white) %an, %ar%Creset"'

alias ohai-github='ssh -vT git@github.com'
alias ohai-gitcorp='ssh -vT git@$ADOBE_GITHUB'


# -------------------------
# yarhnnnn
# -------------------------
alias y='yarn'
alias yr='yarn run'
alias yi='yarn install'
alias yrb='yarn run build'
alias yup='yarn upgrade'
