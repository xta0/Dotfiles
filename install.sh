#!/usr/bin/env bash
set -e

#show login user
USER=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')
echo "login user: $USER"

# Get current dir (so run this script from anywhere)
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export DOTFILES_DIR

#Install brew packages
. "${DOTFILES_DIR}/install/brew.sh"
. "${DOTFILES_DIR}/install/brew-cask.sh"
#Install gem packages  
. "${DOTFILES_DIR}/install/gem.sh"
#Install node modules
. "${DOTFILES_DIR}/install/nvm.sh"
#Install zsh
. "${DOTFILES_DIR}/install/zsh.sh"

#Run Symlinks
. "${DOTFILES_DIR}/install/symlinks.sh"

# Setup macos defaults, add apps to dock and add login items
. "${DOTFILES_DIR}/macos/default.sh"
. "${DOTFILES_DIR}/macos/dock.sh"
. "${DOTFILES_DIR}/macos/login.sh"


#Run exports



