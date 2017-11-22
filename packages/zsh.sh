
#install oh my zsh  
export ZSH="$DOTFILES_DIR/install/oh-my-zsh";
git clone "https://github.com/xta0/oh-my-zsh.git" $ZSH || {
  echo "Could not install Oh My Zsh" >/dev/stderr
  exit 1
}
export ZSH_CUSTOM="${ZSH}/custom"

# Make zsh default shell
sudo chsh -s $(which zsh)

#Install plugins
# echo "Install plugins..."

#syntax-highlight
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting





