#install oh my zsh
sh curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Make zsh default shell
sudo chsh -s $(which zsh)

#Download Themes

# export 
export ZSH="$HOME/.dotfiles/oh-my-zsh"