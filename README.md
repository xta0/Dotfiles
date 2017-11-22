## Dotfiles

Personal dotfile collection used on the MacOS Sierra and above


## Install

### Fresh and clean installation of MacOS:

```
sudo softwareupdate -i -a
xcode-select --install
```

- Install Dotfiels 

```
sh -c "`curl -fsSL https://raw.github.com/xta0/Dotfiles/master/install.sh`"
```

## Contains

### Packages

- Homebrew
    - Some useful macOS apps & dev tools
    - Programming language I use every day.
        
- ZSH
    - A forked [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) repo with customized themes in it 

### Dotfiles

- `.zshrc` contains themes,plugins and loads the `.profile` file.
- `.profile` loads bunch of `alias`, `functions`, `exports` and sets the `PATH` variable
  
## Custom Settings

- macOS
- VSCode
- iTerm
- Dev

## SSH

Sync ssh and other private files with drop-box

## Uninstall

Simply run the `uninstall.sh` , The dotfile fold will be removed from `~/`

## Resources

- [Some useful resource](https://github.com/webpro/dotfiles)
- Thanks for the [Dotfile Community](http://dotfiles.github.io/)


## Todo

- color output
- dotfile commands
- uninstall script
- vimrc, tmuxrc
- docker test environment
