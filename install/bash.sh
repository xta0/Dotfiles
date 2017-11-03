

# Install bash from home brew
brew install bash && \
echo $(brew --prefix)/bin/bash | sudo tee -a /etc/shells && \

# Set default bash
chsh -s $(brew --prefix)/bin/bash