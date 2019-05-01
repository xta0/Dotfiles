

# Install apps for work
apps=(
  alfred 
  iterm2
  dropbox
  flux
  macdown
  slack
  sourcetree
  virtualbox
  visual-studio-code
  amethyst
  handbrake
  xmind
  fliqlo
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
