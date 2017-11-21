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

log() {
    # Green="\[\033[0;32m\]"        # Green
    msg "\033[0;32m${1}\033[0m ${2}"

}

hello() {
    local USER=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')
    msg "Login User: \033[33m$USER\033[0m"
}

main(){

#Check Environment

if [[ "$OSTYPE" != *"darwin"* ]];then
    error "Current OS Type is not MacOS"
    sleep 1
    exit 1
fi

#Say Hello MSG

log "Begin" "Install..."

#Check if dotfile has been installed
if [ ! -n "$DOTFILES_DIR" ]; then 
    DOTFILES_DIR=${HOME}/.dotfiles
    export DOTFILES_DIR
fi



if [ -d "$DOTFILES_DIR" ]; then
    warning "You already have dotfiles installed."
    warning "You'll need to remove $DOTFILES_DIR if you want to re-install."
    exit 1
fi


umask g-w,o-w

#Begin clone dotfile repo
log "Cloning" "Dotfiles..."

hash git >/dev/null 2>&1 || {
    error "Error: git is not installed\n"
    exit 1
}

env git clone https://github.com/xta0/Dotfiles.git $DOTFILES_DIR || {
    error "Error: git clone of oh-my-zsh repo failed"
    exit 1
}



#Install Packages
macos_packages=(
zsh 
brew 
# brew-cask 
gem 
npm 
default 
dock 
login 
)


for PACKAGE in $macos_packages;do
    log "Begin installing" "${PACKAGE}..."
    PACKAGE_DIR=${DOTFILES_DIR}/macos/${PACKAGE}

    if [ -f ${PACKAGE_DIR} ]; then
        chmod +x ${PACKAGE_DIR} && .${PACKAGE_DIR}
    fi
    log "Done installing" "${PACKAGE}..."
done 


# Create symlinks
dotfiles=(
bash_profile 
bashrc
profile 
zshrc 
gitconfig
gitignore_gloabl    
)

for DOTFILE in $dotfiles;do
    
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
unset  PACKAGE PACKAGE_DIR DOTFILE DOTFILE_DIR REPLY

success "Dotfiles installed!"

}

main
