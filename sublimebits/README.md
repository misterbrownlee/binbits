# Hi, me.  It's yourself.

I'm here remind you about how to symlink these so your SublimeText install picks up all your cozy feel good mods.  

Most of this crap goes in:  

    /Users/brownlee/Library/Application Support/Sublime Text 3/Packages/

or 

    /Users/brownlee/Library/Application Support/Sublime Text 3/Packages/User
    
You have to have the packages installed first, before you can override things

Easy to make these mappings copypasta:

```
cd <where this repo is cloned locally>
$DOTFILES_CLONE=`cwd`

# make the theme work
cd /Users/brownlee/Library/Application\ Support/Sublime\ Text\ 3/Packages/
mkdir WebExPert\ -\ ColorScheme
cd WebExPert\ ColorScheme
ln -s $DOTFILES_CLONE/sublimebits/WebExPert\ -\ColorScheme\WebExPert.tmTheme .

#keymap & preferences
cd /Users/brownlee/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s $DOTFILES_CLONE/sublimebits/Default\ \(OSX\).sublime-keymap ./Default\ \(OSX\).sublime-keymap
mv Preferences.sublime-settings original.Preferences.sublime-settings
ln -s $DOTFILES_CLONE/sublime/Preferences.sublime-settings ./Preferences.sublime-settings


Package control install these things also:
- Bracket Highlighter
- Editor Config
- Git Gutter
- Hipster Ipusm
- Jade Support
- Markdown Preview
- Mocha Support
- Modific
- Pretty JSON
- Sass support
- Side Bar Enhancements
- String Encode
- Stylus Support
- Trailing Spaces
- Word Count

Have fun!
