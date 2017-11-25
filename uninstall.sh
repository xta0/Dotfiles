msg(){
    echo -e "Dotfiles: $*"
}
confirmation=$(bash -c 'read -r -p "Are you sure you want to remove dotfiles? [y/N]: " tmp; echo $tmp')
if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
  msg "Uninstall cancelled"
  exit
fi

msg "Removing ~/.dotfiles"
if [ -d ~/.dotfiles ]; then
  rm -rf ~/.dotfiles
fi

dotfiles=(
    profile
    bashrc
    zshrc
    gitconfig
    gitignore_global
)

for dotfile in ${dotfiles[@]}
do
    pre_dotfile="${HOME}/.${dotfile}.pre"
    if [ -f $pre_dotfile ] || [ -h $pre_dotfile ]; then
        msg "Found ${pre_dotfile} -- Restoring to .${dotfile}"
        if [ -f .$dotfile ] || [ -h .$dotfile ]; then 
            dotfile_to_save=".dotfile.$dotfile-uninstalled-$(date +%Y%m%d%H%M%S)";
            msg "Found ~/.$dotfile -- Renaming to ~/${dotfile_to_save}";
            mv ~/.$dotfile ~/"${dotfile_to_save}";
        fi  
        
        mv $pre_dotfile ${HOME}/.$dotfile
        msg "Your original $dotfile was restored."
    fi
done


#restore to bash
if hash chsh >/dev/null 2>&1; then
    msg "Switching back to bash"
    chsh -s /bin/bash
else
    msg "You can edit /etc/passwd to switch your default shell back to bash"
fi

msg "[✔] Dotfiles has been uninstalled."
