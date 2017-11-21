
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
  iterm2
  dropbox
  flux
  google-chrome
  macdown
  slack
  sourcetree
  virtualbox
  visual-studio-code
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
  youdaodict
  keepingyouawake
)

brew cask install --appdir="/Applications" "${apps[@]}"

quick_look=( 
  qlstephen 
  qlmarkdown 
  quicklook-json 
  qlprettypatch 
  quicklook-csv 
  betterzipql 
  qlimagesize 
  webpquicklook 
  qlvideo
)
brew cask install "${quick_look[@]}"
 

sleep 1

#Clean cache
brew cask cleanup
