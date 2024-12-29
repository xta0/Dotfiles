#Install RVM
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

\curl -sSL https://get.rvm.io | bash -s stable

#rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#install ruby
rvm install ruby-3.2.2 --with-openssl-dir=/opt/homebrew/opt/openssl@1.1/
rvm --default use 3.2.2

#Install Gems
gem install bundler
gem install jekyll
