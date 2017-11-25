#! /bin/bash

# enable exist on error
set -x

msg() {
    echo "$fg[$1]${@:2}$reset_color"
}

log() {
    msg 'cyan'  "DotFile: $*"
}

error() {
    echo ; msg 'red'   "DotFile: $*" 
}

success() { 
    echo ; msg 'green' "DotFile: $*"  
}

warning() { 
    echo ; msg 'yellow' "DotFile: $*"  
}

#Check Environment
if [[ "$OSTYPE" != *"darwin"* ]];then
    error "Current OS Type is not MacOS"
    sleep 1
    exit 1
fi

log "Begin Install..."

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
log "Cloning Dotfiles..."

hash git >/dev/null 2>&1 || {
    error "Error: git is not installed!"
    exit 1
}

env git clone https://github.com/xta0/Dotfiles.git $DOTFILES_DIR || {
    error "Error: git clone of Dotfile repo failed!"
    exit 1
}

#Install Packages
log "Installing Packages..."

. "$DOTFILES_DIR/packages/zsh.sh"
. "$DOTFILES_DIR/packages/brew.sh"
. "$DOTFILES_DIR/macos/brew-cask"
. "$DOTFILES_DIR/packages/gem.sh"
. "$DOTFILES_DIR/packages/npm.sh"


# Create symlinks
log "Creating Symlinks..."

ln -svf "$DOTFILES_DIR/dotfiles/.profile" ~
ln -svf "$DOTFILES_DIR/dotfiles/.bashrc" ~
ln -svf "$DOTFILES_DIR/dotfiles/.zshrc" ~
ln -svf "$DOTFILES_DIR/dotfiles/.gitconfig" ~
ln -svf "$DOTFILES_DIR/dotfiles/.gitignore_global" ~

# Custom settings
log "Custom Settings..."

# macOS preference
. "$DOTFILES_DIR/etc/macos/default"
. "$DOTFILES_DIR/etc/macos/login"
. "$DOTFILES_DIR/etc/macos/dock"

# Dev settings
. "$DOTFILES_DIR/etc/dev/chisel"

success "Done! Reload your terminal."
