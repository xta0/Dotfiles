

BIN_NAME=$(basename "$0")
COMMAND_NAME=$1
SUB_COMMAND_NAME=$2

sub_help () {
  echo "Usage: $BIN_NAME <command>"
  echo
  echo "Commands:"
  echo "   clean            Clean up caches (brew, npm, gem, rvm)"
  echo "   list             Show installed packages (brew, gem, npm)"
  echo "   dock             Apply macOS Dock settings"
  echo "   edit             Open dotfiles in VSCode)"
  echo "   help             This help message"
  echo "   macos            Apply macOS system defaults"
  echo "   update           Update packages and pkg managers (OS, brew, npm, gem)"
}

sub_edit () {
    code ${DOTFILES_DIR}
}

sub_dock () { 
    . "${DOTFILES_DIR}/etc/macos/dock" && echo "Dock reloaded."
}


sub_macos () {
    . "${DOTFILES_DIR}/etc/macos/default"
    echo "Done. Some changes may require a logout/restart to take effect."
}

sub_update () {
  sudo softwareupdate -i -a
  brew update
  brew upgrade
  npm install npm -g
  npm update -g
  gem update --system
  gem update
}

sub_clean () {
  brew cleanup
  brew cask cleanup
  npm cache clean --force
  gem cleanup
  rvm cleanup all
}

sub_list() {
  echo "HomeBrew:"
  brew list
  echo "------"
  echo "Gem:"
  gem list
}

case $COMMAND_NAME in 
  "" | "-h" | "--help")
    sub_help
    ;;
  *)
    shift
    sub_${COMMAND_NAME} $@
    if [ $? = 127 ]; then
      echo "'$COMMAND_NAME' is not a known command or has errors." >&2
      sub_help
      exit 1
    fi
    ;;
  esac