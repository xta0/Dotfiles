
#Install NVM
brew install nvm

#nvm 
export DOTFILES_BREW_PREFIX_NVM=`brew --prefix nvm`
if [ -f "$DOTFILES_BREW_PREFIX_NVM/nvm.sh" ]; then
  export NVM_DIR=~/.nvm
  source "$DOTFILES_BREW_PREFIX_NVM/nvm.sh"
fi

#install the latest node 
nvm deactivate
nvm install 8.9.1
nvm use --delete-prefix v8.9.1

# Globally install with npm
packages=( lodash request chalk async commander live-server )

# install packages
npm install -g "${packages[@]}"
