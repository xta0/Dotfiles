export DOTFILES_DIR=${HOME}/.dotfiles

i#nstall oh my zsh
export ZSH="$DOTFILES_DIR/install/oh-my-zsh";

git clone "https://github.com/ohmyzsh/ohmyzsh.git" $ZSH || {
  echo "Could not install Oh My Zsh" >/dev/stderr
  exit 1
}
export ZSH_CUSTOM="${ZSH}/custom"

# Make zsh default shell
echo "Changing shell to ZSH"
sudo chsh -s $(which zsh)

#Install plugins
echo "Install plugins..."
echo "ZSH_CUSTOM: $ZSH_CUSTOM"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
#syntax-highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
# auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions

