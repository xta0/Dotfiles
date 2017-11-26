#Install RVM
brew install gpg
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable

#rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#install ruby
rvm install ruby-2.4.1
rvm --default use 2.4.1

#Install Gems
gem install bundler
gem install rake
gem install rack
gem install nokogiri
gem install jekyll
gem install cocoapods 
gem install houston 
gem install cupertino

