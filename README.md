binbits
=======

Things for ~/bin, which includes bash startup stuff, git configuration, sublime text things, some hold music, and a picture of a naked lady.

PS. One of the above `^` is a lie.

These are helpful things for setting up a new machine:
```bash
cd
git clone git@github.com:misterbrownlee/binbits.git bin
cd bin
DOTFILES_CLONE=`cwd`
cd ..
ln -s $DOTFILES_CLONE/gitbits/git-config .gitconfig
ln -s $DOTFILES_CLONE/gitbits/gitignore_global .gitignore_global

# It adds this .bashrc or it gets the hose
echo "source $DOTFILES_CLONE/bashbits/bash_startup.sh" >> .bashrc

# This stuff is what is in .bash_profile usually
# in case you clobber it by mistake
# or it's not there because of suckage
if [ -f ~/.bashrc ]; 
then
   source ~/.bashrc
fi
```

It's a bitch to symlink the Submlime text stuff, but here ya go:
```bash
cd /Users/brownlee/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
rm Default\ \(OSX\).sublime-keymap && ln -s ~/bin/sublimebits/Default\ \(OSX\).sublime-keymap
rm Markdown.sublime-settings && ln -s ~/bin/sublimebits/Markdown.sublime-settings
rm Preferences.sublime-settings && ln -s ~/bin/sublimebits/Preferences.sublime-settings
rm WebExPert.tmTheme && ln -s ~/bin/sublimebits/WebExPert.tmTheme
rm trailing_spaces.sublime-settings && ln -s ~/bin/sublimebits/trailing_spaces.sublime-settings
```
