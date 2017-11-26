#Install RVM
brew install gpg2
\curl -sSL https://get.rvm.io | bash -s stable

#rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


#Install Ruby
rvm install 2.3
rvm use 2.3 --default

#Install Gem
gems=( nokogiri cocoapods houston cupertino )

gem install "${gems[@]}"
