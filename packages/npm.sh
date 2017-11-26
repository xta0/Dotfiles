
#Install NVM
brew install nvm

#nvm 
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#install the latest node 
nvm install node
#nvm install 6

#update npm
npm install -g npm@latest

# Globally install with npm
packages=( lodash request chalk async commander )

# install packages
npm install -g "${packages[@]}"