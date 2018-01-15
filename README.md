## Dotfiles

Personal dotfile collection used on the MacOS Sierra and above


## Install

### Fresh and clean installation of MacOS:

```
sudo softwareupdate -i -a
xcode-select --install
```

- Install Dotfiles

```
sh -c "$(curl -fsSL https://raw.github.com/xta0/Dotfiles/master/install.sh)"
```

## Contains

```
├── bin
├── dotfiles
├── etc
│   ├── dev
│   ├── iterm
│   └── macos
├── install
│   └── oh-my-zsh
├── packages
└── system
```

### Packages

- Homebrew
    - Some useful macOS apps & dev tools
    - Programming language I use every day.
        
- ZSH
    - A forked [oh-my-zsh](https://github.com/xta0/oh-my-zsh) repo with customized themes in it 

### Dotfiles

- `.zshrc` contains themes,plugins and loads the `.profile` file.
- `.profile` loads a bunch of files: 
    - `alias`
    - `functions`
    - `exports` 
    - sets the `PATH` variable
  
## Custom Settings

- macOS
    - default : macOS preference
    - login: login items
    - dock: dock items
- VSCode
    - use [settings sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
    - use [gist file](https://gist.github.com/xta0/60e005266cb78e9fdf90fde1df980023)
        - Location: `/Users/xxx/Library/Application Support/Code/User`
            - `settings.json`
            - `keybinding.json`
            - snippets
                - `cpp.json`
                - `html.json`
- iTerm
    - color scheme
        - [atom-one-dark](https://github.com/xta0/Dotfiles/blob/master/etc/iterm/atom-one-dark.itermcolors)
        - [dimmed-monokai](https://github.com/xta0/Dotfiles/blob/master/etc/iterm/dimmed-monokai.itermcolors)
- Dev
    - chisel


## Dotfile Usage

```
> dotfile --help

Usage: dotfile.sh <command>

Commands:
   upgrade          Pull the lastest commit from Github
   clean            Clean up caches (brew, npm, gem, rvm)
   list             Show installed packages (brew, gem, npm)
   dock             Apply macOS Dock settings
   edit             Open dotfiles in VSCode)
   help             This help message
   macos            Apply macOS system defaults
   update           Update packages and pkg managers (OS, brew, npm, gem)
```

## Uninstall

```
sh -c "$(curl -fsSL https://raw.github.com/xta0/Dotfiles/master/uninstall.sh)"
```

## Resources

- [Some useful resource](https://github.com/webpro/dotfiles)
- Thanks for the [Dotfile Community](http://dotfiles.github.io/)

## Todo

- docker test environment
