#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew update
brew upgrade
brew tap homebrew/science

# Install tools
brew install coreutils
brew install openssl
brew install wget
brew install ccat
brew install tree
brew install tmux
brew install htop
brew install readline
brew install dockutil
brew install neofetch

# Install programming languages
brew install haskell-stack
brew install smlnj
brew install clisp
brew install mit-scheme
brew install scala
brew install lua
brew install python
brew install python3
brew install node
brew install golang
brew install octave

sleep 1

# Remove outdated versions from the cellar.
brew cleanup

echo "Brew Install Finished!"