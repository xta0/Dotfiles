msg(){
    echo "Dotfiles: $*"
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

backup_dir="${HOME}/.dotfile_backup"
mkdir -p $backup_dir

for dotfile in ${dotfiles[@]}
do
    if [ -f ~/.$dotfile];then 
        
        echo "Deleting the symlinked dotfile:$dotfile"
        rm -rf ~/.$dotfile
    fi 
    
    pre_dotfile="${HOME}/.${dotfile}.pre"
    
    if [ -f $pre_dotfile ] || [ -h $pre_dotfile ]; then
        
        msg "Found ${pre_dotfile} -- Restoring to .${dotfile}"        
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
