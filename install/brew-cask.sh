#!/usr/bin/env bash

# Cask
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions
brew tap homebrew/science

#install brew-cask
brew install brew-cask

# Install apps for work
apps=(
  alfred 
  dash2
  dropbox
  flux
  google-chrome
  macdown
  slack
  sourcetree
  sublime-text
  virtualbox
  visual-studio-code
  webstorm
  spotify
  amethyst
  handbrake
  vagrant
  vagrant-manager
  go2shell
  cleanmymac
  electronic-wechat
  SPlayerX
  FutuNiuniu
  Pomotodo
  YoudaoNote
)

brew cask install --appdir="/Applications" "${apps[@]}"
# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook qlvideo

brew cask install --appdir="/Applications" go2shell




 