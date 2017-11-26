#Install RVM
brew install gnupg
gpg --keyserver hkp://keys.gnupg.net
    --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby

#rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#Install Gems
gem install bundler
gem install rake
gem install rack
gem install nokogiri
gem install jekyll
gem install cocoapods 
gem install houston 
gem install cupertino

