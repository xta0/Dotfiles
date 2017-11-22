#Install RVM
brew install gpg2
\curl -sSL https://get.rvm.io | bash -s stable

#Install Ruby
rvm install 2.3
rvm use 2.3 --default

#Install Gem
gems=( nokogiri cocoapods )

gem install "${gems[@]}"
