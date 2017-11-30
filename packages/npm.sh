
#Install NVM
brew install nvm

#nvm 
export DOTFILES_BREW_PREFIX_NVM=`brew --prefix nvm`
if [ -f "$DOTFILES_BREW_PREFIX_NVM/nvm.sh" ]; then
  export NVM_DIR=~/.nvm
  source "$DOTFILES_BREW_PREFIX_NVM/nvm.sh"
fi

#install the latest node 
nvm install stable

# Globally install with npm
packages=( lodash request chalk async commander )

# install packages
npm install -g "${packages[@]}"