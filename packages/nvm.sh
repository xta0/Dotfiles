
#Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.40.1/install.sh | bash

#Export NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#install the latest node 
nvm install --lts
# Globally install with npm
packages=( eslint lodash request chalk async commander live-server bower typescript)

# install packages
npm install -g "${packages[@]}"
