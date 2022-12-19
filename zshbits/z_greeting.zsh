
# ---------------------------
# a way to greet yourself
#

greet="Welcome, $USER"
# hour=$(date +"%H")

# COWS=(/usr/local/Cellar/cowsay/3.03/share/cows/*)
# MAX_COW=`ls /usr/local/Cellar/cowsay/3.03/share/cows | wc -l`
# COW_NUM=$RANDOM;
# COW_NUM=$[ $COW_NUM % $MAX_COW ]

# display greet
# echo -e "\033[0;32m"
# echo ---------------------------------------------------------------
# # echo -e "\n\n\n"
# cowsay -f "${COWS[COW_NUM]}" $greet
# fortune | cowsay | toilet --gay -f term

echo '\n'
echo "$fg[green]---------------------------------------------------------------$reset_color"
echo '\n'
echo "$fg_bold[green]     $greet$reset_color"
echo '\n'
echo "$fg[green]---------------------------------------------------------------$reset_color"
echo '\n'

tput sgr0
