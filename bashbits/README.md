# BASHBITS because we liked that before z came along

I have been an OSX user since 2007 and before that I used to have to terminal into servers and know linux stuff, like how to maybe almost take down Well Fargo's banking website by restarting the web app process on production rather than stage. Lucky for everyone some admin was good a permissions and just typing the same command over and over didn't work. 

Anyway. The bash bits are particulary nice. 

We once in a while need to remember how this all is set up. Here, past me wants to remind some theoretical future me how to do this:


```bash
cd
git clone git@github.com:misterbrownlee/binbits.git bin
cd bin
DOTFILES_CLONE=`cwd`
cd ..
ln -s $DOTFILES_CLONE/gitbits/git-config .gitconfig
ln -s $DOTFILES_CLONE/gitbits/gitignore_global .gitignore_global

# Now me does
cat $DOTFILES_CLONE/bashbits/example_bash_profile.txt" >> .bash_profile
cat $DOTFILES_CLONE/bashbits/example_bashrc.txt" >> .bashrc
cat $DOTFILES_CLONE/bashbits/example_profile.txt" >> .profile

# This stuff is what is in .bash_profile usually
# but not mine, because I believe everything I read on stackexchange
# I put this here to remind myself of what past me used to do
```shell
if [ -f ~/.bashrc ]; 
then
   source ~/.bashrc
fi
```

You can read `./bashbits/example_bash_profile.txt` if you wanna know more.

## Sublime FTW
Gosh, I sure did love Sublime Text.  Truthfully, in 2026 I'm still using it to keep an eye on what the robots are doing. It's not really an IDE.  But if you need to put a bunch of cursors all over a text file, it's pretty great at that.


It's a hassle to symlink the Submlime text stuff, but here ya go... This was right as of Sierra (10.12.6) and Sublime Text 3 (3126):

```bash
cd /Users/brownlee/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
rm Default\ \(OSX\).sublime-keymap && ln -s ~/bin/sublimebits/Default\ \(OSX\).sublime-keymap
rm Markdown.sublime-settings && ln -s ~/bin/sublimebits/Markdown.sublime-settings
rm Preferences.sublime-settings && ln -s ~/bin/sublimebits/Preferences.sublime-settings
rm WebExPert.tmTheme && ln -s ~/bin/sublimebits/WebExPert.tmTheme
rm trailing_spaces.sublime-settings && ln -s ~/bin/sublimebits/trailing_spaces.sublime-settings
```


