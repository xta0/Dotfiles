read -r -p "Are you sure you want to remove dotfiles? [y/N] " confirmation
if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
  echo "Uninstall cancelled"
  exit
fi

echo "Removing ~/.dotfiles"
if [ -d ~/.dotfiles ]; then
  rm -rf ~/.dotfiles
fi

chsh >/dev/null 2>&1; then

if hash chsh >/dev/null 2>&1; then
    echo "Switching back to bash"
    chsh -s /bin/bash
else
    echo "You can edit /etc/passwd to switch your default shell back to bash"
fi

echo "Dotfiles has been uninstalled."
