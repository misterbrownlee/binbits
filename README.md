binbits
=======

# THIS README IS ALWAYS WRONG 
# so watch the fuck out...

Things for ~/bin, which includes bash startup stuff, git configuration, sublime text things, some hold music, and a picture of a naked lady.

PS. One of the above is a lie.

The bash bits are particulary nice.  Here, I remind myself to do this:
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
It's a bitch to symlink the Submlime text stuff, but here ya go... at least for Sierra (10.12.6) and Sublime Text 3 (3126):

```bash
cd /Users/brownlee/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
rm Default\ \(OSX\).sublime-keymap && ln -s ~/bin/sublimebits/Default\ \(OSX\).sublime-keymap
rm Markdown.sublime-settings && ln -s ~/bin/sublimebits/Markdown.sublime-settings
rm Preferences.sublime-settings && ln -s ~/bin/sublimebits/Preferences.sublime-settings
rm WebExPert.tmTheme && ln -s ~/bin/sublimebits/WebExPert.tmTheme
rm trailing_spaces.sublime-settings && ln -s ~/bin/sublimebits/trailing_spaces.sublime-settings
```
