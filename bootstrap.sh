#! /bin/bash

# enable exist on error
set -e


msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$?" -eq '0' ]; then
        msg "\033[1;32m [✔] \033[0m ${1}${2}"
    fi
}

warning() {
    msg "\033[40;1;33m Warning: \033[0m ${1}${2}"
}

error() {
    msg "\033[1;31m[✘]\033[0m ${1}${2}"    
}

hello() {
    local USER=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')
    msg "Login User: \033[33m$USER\033[0m"
}

main(){

hello ""

#Check if dotfile has been installed
if [ ! -n "$DOTFILES_DIR" ]; then 
    DOTFILES_DIR=${HOME}/.dotfiles
    export DOTFILES_DIR
fi

#export utils
PATH="$DOTFILES_DIR/bin:$PATH"

if [ -d "$DOTFILES_DIR" ]; then
    warning "You already have dotfiles installed.\n"
    warning "You'll need to remove $DOTFILES_DIR if you want to re-install.\n"
    exit 1
fi


umask g-w,o-w

#Begin clone dotfile repo
msg "Cloning Dotfiles..."

hash git >/dev/null 2>&1 || {
    error "Error: git is not installed\n"
    exit 1
}

env git clone https://github.com/xta0/Dotfiles.git || {
    error "Error: git clone of oh-my-zsh repo failed"
    exit 1
}
#Install Packages
installs=(
zsh 
brew 
brew-cask 
gem 
npm 
default 
dock 
login 
)

if is-macos; then 
    for INSTALL in macos
    do
        INSTALL_DIR=${DOTFILE_DIR}/install/${INSTALL}
        [ -f ${INSTALL_DIR} ] && . ${INSTALL_DIR}
    done 
fi 

# Create symlinks
dotfiles=(
bash_profile 
bashrc
profile 
zshrc 
gitconfig
gitignore_gloabl    
)

for DOTFILE in dotfiles;do
    
    DOTFILE_DIR=${DOTFILES_DIR}/dotfiles/${DOTFILE}
    #Check existing dotfiles
    if [ -e "$HOME/.$DOTFILE" ]; then 
        read ".$DOTFILE alreadly exists in your home directory. Are you sure to overwrite it? ([y]/n)" REPLY
        if [[ ! $REPLY ]] || [[ $REPLY =~ ^[Yy]$ ]]; then
            ln -sf "${DOTFILE_DIR}" "${HOME}/.${DOTFILE}"
        fi
    else
        ln -s "${DOTFILE_DIR}" "${HOME}/.${DOTFILE}"
    fi
done 

#clean up
unset  INSTALL INSTALL_DIR DOTFILE DOTFILE_DIR REPLY

success "Dotfiles installed!"

}

main
