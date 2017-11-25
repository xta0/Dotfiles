#! /bin/bash

# enable exist on error
set -e

init(){
    #colors
    RCol='\e[0m'
    Red='\e[0;31m'; 
    Gre='\e[0;32m';
    Yel='\e[0;33m';
    Blu='\e[0;34m';
    On_Bla='\e[40m';    
    BIGre='\e[1;92m';
}

log() {
    echo -e "${Blu}DotFiles:${RCol} '$*' "
}

error() {
    echo ; 
    echo -e "${Red}DotFiles:${RCol} ${Red}${On_Bla}[✘]${RCol} '$*' "
}

success() { 
    echo ; 
    echo -e "${Gre}DotFiles:${RCol} ${Gre}${On_Bla}[✔]${RCol} '$*' "
}

warning() { 
    echo ; 
    echo -e "${Yel}DotFiles:${RCol} ${Yel}${On_Bla}[Warning]${RCol}  '$*' \n"
}

init

#Check Environment
if [[ "$OSTYPE" != *"darwin"* ]];then
    error "Current OS Type is not MacOS"
    sleep 1
    exit 1
fi

log "Begin Install Dotfiles"

#Check if dotfile has been installed
if [ ! -n "$DOTFILES_DIR" ]; then 
    DOTFILES_DIR=${HOME}/.dotfiles
    export DOTFILES_DIR
fi


if [ -d "$DOTFILES_DIR" ]; then
    warning "You already have dotfiles installed.$DOTFILES_DIR"
    reply=$(bash -c 'read -r -p "Do you want to remove it?[y/N]: " tmp; echo $tmp')
    if [[ ! $reply ]] || [[ $reply =~ ^[Yy]$ ]; then 
        log "Removing ~/.dotfiles"
        rm -rf ${DOTFILES_DIR}
    else
        log "Install canclled";sleep 1
        exit 1
    fi 
fi


umask g-w,o-w

#Begin clone dotfile repo
log "Cloning Dotfiles"

hash git >/dev/null 2>&1 || {
    error "git is not installed!"
    sleep 1
    exit 1
}

env git clone https://github.com/xta0/Dotfiles.git $DOTFILES_DIR || {
    error "git clone of Dotfile repo failed!"
    sleep 1
    exit 1
}

#Install Packages
log "Installing Packages..."

. "$DOTFILES_DIR/packages/zsh.sh"
. "$DOTFILES_DIR/packages/brew.sh"
. "$DOTFILES_DIR/macos/brew-cask.sh"
. "$DOTFILES_DIR/packages/gem.sh"
. "$DOTFILES_DIR/packages/npm.sh"


# Create symlinks
dotfiles=(
    profile
    bashrc
    zshrc
    gitconfig
    gitignore_global
)

for dotfile in ${dotfiles[@]}
do
    orig_dotfile="${HOME}/.${dotfile}"
    if [ -f $orig_dotfile ]; then
        log "Found ${orig_dotfile} ${BIGre}Backing up${RCol} to ${Yel} ${orig_dotfile}.pre ${RCol}" 
        mv $orig_dotfile $orig_dotfile.pre;
    fi
    log "Creating Symlinks" 
    ln -svf "$DOTFILES_DIR/dotfiles/.$dotfile" ${HOME}
done


# Custom settings
log "Runing Custom Settings"
. "$DOTFILES_DIR/etc/macos/default"
. "$DOTFILES_DIR/etc/macos/login"
. "$DOTFILES_DIR/etc/macos/dock"

# Dev settings
. "$DOTFILES_DIR/etc/dev/chisel"

success "Done! Now reload your terminal."
