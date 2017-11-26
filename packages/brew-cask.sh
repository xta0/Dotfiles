

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
  go2shell
  cleanmymac
  electronic-wechat
  bitbar
  keepingyouawake
  SPlayerX
  FutuNiuniu
  Pomotodo
  YoudaoNote
  youdaodict

)

brew cask install --appdir="/Applications" "${apps[@]}"

quick_look=( 
  qlmarkdown 
  quicklook-json 
  quicklook-csv  
  qlimagesize 
)
brew cask --appdir="/Applications" install "${quick_look[@]}"
 

sleep 1

#Clean cache
brew cask cleanup
