

#Install NVM
brew install nvm


export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

. "${DOTFILES_DIR}/system/.nvm"
nvm install 6

# Globally install with npm
packages=(
  npm
)

npm install -g "${packages[@]}"