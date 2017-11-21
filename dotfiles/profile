
# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

if [ ! -n "$DOTFILES_DIR" ]; then 
    DOTFILES_DIR=~/.dotfiles
fi

for DOTFILE in "$DOTFILES_DIR"/system/{functions,path,exports,env,alias,alias_macos}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done



unset DOTFILE

export DOTFILES_DIR