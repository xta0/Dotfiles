
#Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

#Export NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#install the latest node 
nvm install 8.9.1
# Globally install with npm
packages=( eslint lodash request chalk async commander live-server jest )

# install packages
npm install -g "${packages[@]}"
