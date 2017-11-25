#! /bin/bash

init(){
    
    if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
    fi

    if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
        
        RCol="$(tput sgr0)"
        Red="$(tput setaf 1)"
        Gre="$(tput setaf 2)"
        Blu="$(tput setaf 4)"
        Yel="$(tput setaf 3)"
        Bold="$(tput bold)"
        On_Bla="$(tput setab 0)"
  else
        #colors
        RCol="";
        Red="";
        Gre="";
        Blu="";
        Yel="";
        Bold=""
        On_Bla=""
  fi
}

log() {
    echo -e "${Blu}${On_Bla}DotFiles:${RCol} '$*' "
}

error() {
    echo ; 
    echo -e "${Red}${On_Bla}DotFiles:${RCol} ${Red}${On_Bla}[✘]${RCol} '$*' "
}

success() { 
    echo ; 
    echo -e "${Gre}${On_Bla}DotFiles:${RCol} ${Gre}${On_Bla}[✔]${RCol} '$*' "
}

warning() { 
    echo ; 
    echo -e "${Yel}${On_Bla}DotFiles:${RCol} ${Yel}${On_Bla}[Warning]${RCol}  '$*' \n"
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
# dotfiles=(
#     profile
#     bashrc
#     zshrc
#     gitconfig
#     gitignore_global
# )

# for dotfile in ${dotfiles[@]}
log "Creating Symlinks"
for dotfile in $(ls ${DOTFILES_DIR}/dotfiles/)
do
    orig_dotfile="${HOME}/.${dotfile}"
    if [ -f $orig_dotfile ]; then
        log "Found ${orig_dotfile} Backing up to ${orig_dotfile}.pre" 
        mv $orig_dotfile $orig_dotfile.pre;
    fi
    log "Creating Symlink: ${Gre} ${HOME}/.$dotfile ${RCol}" 
    ln -svf "$DOTFILES_DIR/dotfiles/$dotfile" ${HOME}/.$dotfile
done


# Custom settings
log "Runing Custom Settings"
. "$DOTFILES_DIR/etc/macos/default"
. "$DOTFILES_DIR/etc/macos/login"
. "$DOTFILES_DIR/etc/macos/dock"

# Dev settings
. "$DOTFILES_DIR/etc/dev/chisel"

success "Done! Now reload your terminal."
