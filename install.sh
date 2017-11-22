#! /bin/bash

# enable exist on error
set -x

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

hello ""

log "Begin" "Install..."

#Check if dotfile has been installed
log "Checking" "directory..."
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
log "Installing" "Packages..."

. "$DOTFILES_DIR/packages/zsh.sh"
. "$DOTFILES_DIR/packages/brew.sh"
. "$DOTFILES_DIR/macos/brew-cask"
. "$DOTFILES_DIR/packages/gem.sh"
. "$DOTFILES_DIR/packages/npm.sh"


# Create symlinks
log "Creating" "Symlinks..."

ln -svf "$DOTFILES_DIR/dotfiles/.profile" ~
ln -svf "$DOTFILES_DIR/dotfiles/.bashrc" ~
ln -svf "$DOTFILES_DIR/dotfiles/.zshrc" ~
ln -svf "$DOTFILES_DIR/dotfiles/.gitconfig" ~
ln -svf "$DOTFILES_DIR/dotfiles/.gitignore_global" ~

# Custom settings
log "Custom" "Settings..."

# macOS preference
. "$DOTFILES_DIR/etc/macos/default"
. "$DOTFILES_DIR/etc/macos/login"
. "$DOTFILES_DIR/etc/macos/dock"

# Dev settings
. "$DOTFILES_DIR/etc/dev/chisel"

success "Dotfiles installed!"

}

main
