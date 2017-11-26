#Install RVM
brew install gpg2
\curl -sSL https://get.rvm.io | bash -s stable

#nvm 
export NVM_DIR="$PATH:$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#Install Ruby
rvm install 2.3
rvm use 2.3 --default

#Install Gem
gems=( nokogiri cocoapods houston cupertino )

gem install "${gems[@]}"
